#!/bin/env bash

source ./env-vars.set.sh

##########
# FILE PERMISSIONS
##########

find . -type f -exec chmod 777 {} \;
find . -type d -exec chmod 777 {} \;
zip -qr function.zip .
cp function.zip ../aws-services/lambda/

##########
# IAM SETUP
##########

cd ../aws-services/iam/
role_name="lambdaDDB"
bash create-role.sh "$role_name" "ddb-access.json"
bash attach-role-policy.sh "$role_name" "AmazonDynamoDBFullAccess"
bash attach-role-policy.sh "$role_name" "service-role/AWSLambdaBasicExecutionRole"

##########
# DYNAMODB SETUP
##########

cd ../dynamodb/
bash create-table.sh "MOVIE" "movieid" "S" "moviename" "S" "5"
movie_stream=$(bash describe-table.sh "MOVIE" | grep LatestStreamArn | cut -d'"' -f4)

bash create-table.sh "EMPLOYEE" "employeeid" "S" "employeename" "S" "25"
employee_stream=$(bash describe-table.sh "EMPLOYEE" | grep LatestStreamArn | cut -d'"' -f4)

##########
# LAMBDA SETUP
##########

cd ../lambda/
lambda_function_name=$lambda_function_name
lambdaEnvironment="{ENV='prod',RMQ_PERSISTENT='False',RMQ_QUEUE='prod_queue',RMQ_SERVER_1='$rmq1_fqdn',RMQ_SERVER_2='$rmq2_fqdn',RMQ_PORT_1='$rmq_port',RMQ_PORT_2='$rmq_port',RMQ_PASS_1='$rmq_pwd',RMQ_PASS_2='$rmq_pwd',RMQ_USER_1='$rmq_user',RMQ_USER_2='$rmq_user'}"
bash create-function.sh "$function_name" "index.handler" "python3.6" "$lambdaEnvironment" "arn:aws:iam::000000000000:role/lambdaDDB"
rm function.zip
for stream in "$movie_stream" "$employee_stream"
do
    bash ddbstreams-lambda-rmq.sh "$function_name" "$stream"
done

cd ../../example/
