#!/bin/bash

echo -n "Enter directory name: "
read directory

mkdir ~/$directory ; sudo cp -r /var/log/* /etc/passwd /etc/shadow /etc/hosts ~/$directory

sudo find /home/ -type f -perm 777 -name > ~/$directory

ps aux --sort -%mem | awk {'print $1,$2,$3,$11'} | head -10 > ~/$directory/processes.txt

cat /etc/passwd | awk -F ":" '{if ($3 >=1000) print $0}' > ~/$directory/users1000.txt
