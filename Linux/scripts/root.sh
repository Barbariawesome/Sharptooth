#!/bin/bash

echo "which UID are you using: "
read uid

echo -e "User info:\n$(id -a $uid)"

if [ $uid -eq 0 ]
then
    echo "Please do not run this script as root."
else
    echo "Acceptable UID to run script."
fi

output=$HOME/research/sys_info_output.txt
if [ ! -d $Home/research ]
then
    mkdir $HOME/research
    echo "$HOME/research directory exists"
fi

ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(find /home -type f -perm 777 2>/dev/null)
memused=$(ps aux --sort -%mem | awk {'print $1,$2,$3,$4,$11'} | head)

echo $memused
