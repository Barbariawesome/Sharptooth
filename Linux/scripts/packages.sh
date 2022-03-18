#!/bin/bash

#define packages list
packages=('nano' 'wget' 'net-tools')

#loop though the list of packages
for packages in ${packages[@]};
do
    if [ $(which $packages) ]
    then
	echo "$package is installed at $(which $package)."
    else
	echo "$package is not installed."
    fi
done

#search each user home directory
for user in $(ls /home);
do
    for item in $(find /home/$user -type f -iname '*.sh'  2>/dev/null);
    do
	echo -e "Found a script in the $user's home folder! \n$item"
    done
done

#loop through scripts in my script folder
for script in $(ls ~Documents/my_scripts);
do
    if [ ! -x ~/Documents/my_scripts/$script ]
    then
	chmod +x ~/Documents/my_scripts/$script
    fi
done

#loop thorugh a group
for file in $(ls ~/Documents/my_scripts/);
do
	sha256sum $file
done
