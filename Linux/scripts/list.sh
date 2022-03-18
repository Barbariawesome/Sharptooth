#!/bin/bash

#lsit variable
months=('jan' 'feb' 'march' 'april' 'may' 'june' 'july' 'aug' 'spet' 'oct' 'nov' 'dec')

days=('mon' 'tues' 'wed' 'thurs' 'fri' 'sat' 'sun')

# create loop

for month in ${months[@]};
do 
    echo $month
done

#print out the days 
for day in ${day[@]};
do 
    if [ $day = 'sun' ] || [ $day = 'sat' ]
    then
	echo "Its $day. Take it easy."
    else
	echo "Get to work."
    fi
done

#run a command on each file

for file in $(ls);
    do
       ls -lah $file
    done

#run an operation on each number
for num in {0..5};
do
    if [ $num = 1 ] || [ $num = 4 ]
    then
	echo $num
    fi
done
