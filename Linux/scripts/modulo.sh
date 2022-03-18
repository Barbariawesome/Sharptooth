#!/bin/bash

numbers=$(echo {0..99})

for num in ${numbers[@]}
do
    if [ `expr $num % 3` -eq 0 ]
    then
	echo "$num"
    fi
done
