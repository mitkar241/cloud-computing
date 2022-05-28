#!/bin/env bash
source ../utils.sh

function_name=$1
handler=$2
runtime=$3
environment_variables=$4
role=$5

set_cursor
output=$($AWS lambda create-function \
    --function-name $function_name \
    --zip-file fileb://function.zip \
    --handler $handler \
    --runtime $runtime \
    --environment Variables="$environment_variables" \
    --role $role)
set_status
echo "Creating Lambda function $function_name : $status"
