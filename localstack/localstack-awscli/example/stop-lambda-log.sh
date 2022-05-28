#!/bin/env bash

sudo ls > /dev/null 2>&1
sudo kill -9 $(ps aux | grep "sudo python3 start-lambda-log" | grep -v grep | awk '/python/ {print $2}')
