#!/bin/env bash

export container_name="default-localstack-container"
export host_port="5001"
alias AWS="aws --endpoint-url http://localhost:$host_port"
