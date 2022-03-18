#!/bin/bash

states=('CA' 'AZ' 'HI' 'CO' 'NV' 'UT')

for state in ${states[@]}
do
    if [ $state == 'HI' ];
    then
	echo "You chose $state: HI is the best!"
    else
	echo "You chose $state: Boo you suck!"
fi
done

