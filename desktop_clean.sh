#!/bin/sh

#Check the Drive Space Used by Cached Files
du -sh /var/cache/apt/archives

#Clean all the log files

logs=`find /var/log -type f`
for i in $logs
do
> $i
done

#Free up space by clean out the cached packages
apt-get clean
apt-get autoclean

# Remove the Trash
rm -rf /home/*/.local/share/Trash/*/**
rm -rf /root/.local/share/Trash/*/**

# Remove Man
rm -rf /usr/share/man/?? 
rm -rf /usr/share/man/??_*

#Delete all .gz logs files
find /var/log -type f -regex ".*\.gz$" | xargs rm -Rf

#Cleaning the old kernels
dpkg-query -l|grep linux-im*

#Cleaning is completed
echo "Cleaning is completed"