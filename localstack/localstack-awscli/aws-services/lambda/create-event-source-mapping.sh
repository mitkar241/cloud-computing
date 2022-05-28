#!/bin/env bash
source ../utils.sh

function_name=$1
event_source=$2

set_cursor
output=$($AWS lambda create-event-source-mapping \
    --function-name $function_name \
    --batch-size 100 \
    --starting-position LATEST \
    --event-source-arn $event_source)
set_status
echo "Creating Event Source Mapping from Event source $event_source to Lambda function $function_name : $status"
