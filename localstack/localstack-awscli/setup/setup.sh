#!/bin/env bash -e

source package.sh
source formatting.sh

sudo ls > /dev/null 2>&1
clear
hideCursor
trap cleanup EXIT

bash check-internet.sh

underLine "Pre-requisite for LocalStack framework"
installPkg "python3" "sudo apt install -y python3"
installPkg "pip3" "sudo apt install -y python3-pip"
refreshPkg "libsasl2-dev installation" "sudo apt install -y libsasl2-dev"
installPkg "zip" "sudo apt install -y zip"
installPkg "wget" "sudo apt install -y wget"
installPkg "aws" "sudo apt install -y awscli"
doubleLine  "Pre-requisites have been Installed"

underLine "Container to run LocalStack"
installPkg "docker" "sudo apt install -y docker.io"
sudo usermod -aG docker $USER
installPkg "docker-compose" "sudo apt install -y docker-compose"
doubleLine "Container setup is Complete"

bash images-handler.sh

doubleLine "Set-up is complete ! Welcome to Localstack !"
