ifocnfig#!/bin/bash

echo "title"
date
uname -a
ifconfig enp0s3 | grep 'inet'
hostname

nmcli dev show | grep DNS
free
echo -e "\nWho is lodded in: \n $(who) \n"
lscpu | grep CPU
df -H | head -5

