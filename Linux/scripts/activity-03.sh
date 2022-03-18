#!/bin/bash

#Check if script was runas root Exit if true
if [ $UID -eq 0 ]
then
    echo "Please do not run this script as root"
    exit
fi

# define variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(find ~ -type f -perm 777 2>/dev/null)

#check for reasrch dir
if [ ! -d $HOME/research ]
then
  mkdir $HOME/research
fi

#check for output file. Clear it if needed.
if [ -f $output ]
then
  rm $output
fi

echo "A quick system Audit script" >> $output
date >> $output
echo "" >> $output
echo "MAchine Type Info:" >> $output
echo -e "$MACHINE \n" >> $output
echo -e "Uname info:: \n" >> $output
echo -e "IP Info:" >> $output
echo -e "ip \n" >> $output
echo -e "Hostname: $(hostname -s) \n" >> $output
echo "DNS servers: " >> $output
cat /etc/resolv.conf >> $output
echo -e "\nMemory Info: " >> $output
free >> $output
echo -e "\nCPU Info: " >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who -a) \m" >> $output
echo -e "\nEXEC Files: " >> $output
echo $execs >> $output
echo -e "\nTop 10 processes" >> $output
ps aux --sort -%mem | awk {'print $1,$2,$3,$4,$11'} | head >> $output
