#!/bin/env bash

docker container stop $container_name
docker container rm $container_name
rm $container_name.yml
