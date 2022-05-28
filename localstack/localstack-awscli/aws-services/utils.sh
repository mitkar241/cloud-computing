#!/bin/env bash

# set AWS alias
AWS="aws --endpoint-url http://localhost:$host_port"

set_cursor() {
	status="FAILURE"
	tput cuu 1
}

set_status() {
	if [ $? -eq 0 ]; then
		tput cud 1
		status="SUCCESS"
	else
		status="FAILURE"
	fi
}
