#!/bin/env bash
source ../utils.sh

table_name=$1
$AWS dynamodb scan --table-name $table_name
