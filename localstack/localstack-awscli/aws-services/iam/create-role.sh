#!/bin/env bash
source ../utils.sh

role_name=$1
assume_role_policy_document=$2

set_cursor
createRoleOutput=$($AWS iam create-role \
    --role-name $role_name \
    --assume-role-policy-document file://$assume_role_policy_document)
set_status
echo "Creating IAM Role $role_name with policy document $assume_role_policy_document : $status"
