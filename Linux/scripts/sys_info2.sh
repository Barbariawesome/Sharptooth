#!/bin/bash

mkidr ~/research 2>/dev/null

sudo find /home/ -type f -perm 777 > ~/research/sys_info.txt

ps aux --sort -%mem | awk {'print $1,$2,$3,$11'} | head -10 >> ~/research/sys_info.txt

cat /etc/passwd | awk -F ":" '{if ($3 >=1000) print $0}' >> ~/research/sys_info.txt


