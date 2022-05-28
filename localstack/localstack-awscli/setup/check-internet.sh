#!/bin/env bash -e

source package.sh
source formatting.sh

sudo ls > /dev/null 2>&1
clear
hideCursor
trap cleanup EXIT

underLine "Checking Internet Connectivity"
installPkg "curl" "sudo apt -y install curl"

##########
# IPV4 CONNECTIVITY
##########

ipv4=0
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "IPv4 is up"
  ipv4=1
else
  echo "IPv4 is down"
fi

##########
# DNS CONNECTIVITY
##########

dns=0
if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo "The network is up"
  dns=1
else
  echo "The network is down"
fi

##########
# HTTPS CONNECTIVITY
##########

https=0
case "$(curl -s --max-time 2 -I https://google.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
  [23]) echo "HTTPS connectivity is up"
  https=1;;
  5) echo "The web proxy won't let us through";;
  *) echo "The network is down or very slow";;
esac

##########
# NETWORK CONNECTIVITY
##########

if [ "$ipv4" = "1" ]  && [  "$dns" = "1" ]  && [  "$https" = "1" ]  ; then
	doubleLine "Perfect Internet Connectivity"
else
	doubleLine "Check Internet Connectivity"
	exit 1
fi
