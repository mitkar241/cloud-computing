#!/bin/env bash

source version.sh

is_port_free=$(ss -tulpn | grep ':'$host_port | wc -l)
if [ $is_port_free == "0" ]
	then
		create-docker-compose
		docker-compose --project-name mobility-setup-$container_name --file $container_name.yml up -d
	else
		echo "Port $host_port is not Free. Choose some other Port..."
fi
