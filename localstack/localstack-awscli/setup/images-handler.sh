#!/bin/bash

sudo ls > /dev/null 2>&1

##########
# LOCALSTACK IMAGE
##########
printf "\ndownloading docker image localstack/localstack ...\n"
wget https://artifactory.com/artifactory/localstack.tar
printf "\nloading docker image localstack/localstack ..."
sudo docker load -i localstack.tar > /dev/null 2>&1  &

wait
printf "\ndeleting localstack.tar ...\n"
rm localstack.tar

##########
# LAMBDA.PY3 IMAGE
##########

printf "\ndownloading docker image lambci/lambda:20191117-python3.6 ...\n"
wget https://artifactory.com/artifactory/lambci-lambda-python3.6.tar
printf "\nloading docker image lambci/lambda:20191117-python3.6 ..."
sudo docker load -i lambci-lambda-python3.6.tar > /dev/null 2>&1  &

wait
printf "\ndeleting lambci-lambda-python3.6.tar ...\n"
rm lambci-lambda-python3.6.tar
