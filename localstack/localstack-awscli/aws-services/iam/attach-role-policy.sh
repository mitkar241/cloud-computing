#!/bin/env bash
source ../utils.sh

role_name=$1
policy_arn=$2

set_cursor
createRoleOutput=$($AWS iam attach-role-policy \
    --role-name $role_name \
    --policy-arn arn:aws:iam::aws:policy/$policy_arn)
set_status
echo "Attaching Role Policy $policy_arn to IAM Role $role_name : $status"
