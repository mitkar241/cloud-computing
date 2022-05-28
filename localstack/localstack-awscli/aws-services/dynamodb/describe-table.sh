#!/bin/env bash
source ../utils.sh

table_name=$1
$AWS dynamodb describe-table --table-name $table_name
