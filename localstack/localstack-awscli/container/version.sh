#!/bin/env bash

DOLLAR="$"

create-docker-compose() {
	cat > ${container_name}.yml <<EOF
version: '2.1'

services:
  localstack:
    container_name: ${container_name}
    image: localstack/localstack #0.12.3
    network_mode: bridge
    ports:
      - "${host_port}:4566"
    environment:
      - LAMBDA_EXECUTOR=docker
      - AWS_ACCESS_KEY_ID=temp
      - AWS_SECRET_ACCESS_KEY=temp
      - AWS_DEFAULT_REGION=us-east-1
      - LAMBDA_TASK_ROOT=.
      - DOCKER_HOST=unix:///var/run/docker.sock
    volumes:
      - "/tmp/${container_name}:/tmp/localstack"
      - "/var/run/docker.sock:/var/run/docker.sock"
EOF
}
