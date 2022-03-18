#!/bin/bash

output=~/research/sys_info.txt
files=('/etc/passwd' '/etc/shadow' '/etc/hosts')
commands=('date' 'uname -a' 'hostname -s')

echo -e "\nThe permissions for sensitive /etc files: \n" >> $output
for file in ${files[@]}
do
   ls -l $file >> $output
done

echo -e "\n CPU Info: " >> $output
lscpu | grep CPU >> $output

echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output

echo -e "\nCurrent user login information: \n $(who -a) \n" >> $output

for user in $(ls /home)
do
    sudo -lU $user
done

for x in {0..2}
do
    results=$(${commands[$x]})
    echo "Results of \"${commands[$x]}\" command:"
    echo $results
    echo ""
done
