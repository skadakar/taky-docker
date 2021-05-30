#!/bin/sh
echo "chownhack"
chown -R taky:taky /data


echo "Preparing folder structure"
mkdir -p /data/conf
mkdir -p /data/ssl
mkdir -p /data/logs
mkdir -p /data/upload
mkdir -p /data/database
echo "Resetting config file"
cp -f /taky.conf /data/conf/taky.conf

#redis
if [ -z "${redis}" ]; then
	echo "Using default redis (false)"
else
	#do nerdshit here
	redis-server --daemonize yes
fi

#Env handling
echo "Adding variables to relevant config files"
source env.sh


#Starting taky
echo "Starting taky data package service as taky user"
taky_dps -c /data/conf/taky.conf -l debug
