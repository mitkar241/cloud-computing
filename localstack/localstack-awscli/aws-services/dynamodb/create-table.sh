#!/bin/env bash
source ../utils.sh

table_name=$1
hash_key=$2
hash_key_type=$3
range_key=$4
range_key_type=$5
capacity_units=$6

set_cursor
output=$($AWS dynamodb create-table \
    --table-name $table_name \
    --attribute-definitions \
        AttributeName=$hash_key,AttributeType=$hash_key_type \
        AttributeName=$range_key,AttributeType=$range_key_type \
    --key-schema \
        AttributeName=$hash_key,KeyType=HASH \
        AttributeName=$range_key,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=$capacity_units,WriteCapacityUnits=$capacity_units \
    --stream-specification StreamEnabled=true,StreamViewType=NEW_AND_OLD_IMAGES)
set_status
echo "Creating DynamoDB Table $table_name : $status"
