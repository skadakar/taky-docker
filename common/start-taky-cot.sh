#!/bin/sh
echo "Preparing folder structure"
mkdir -p /data/conf
mkdir -p /data/ssl
mkdir -p /data/logs
mkdir -p /data/upload
mkdir -p /data/database

#SSL
if [ -z "${ssl_enabled}" ]; then
	echo "No SSL configured"
else
	if [ -f "/data/ssl/server.p12" ]; then
    		echo "Certs already configured, skipping."
	else
		echo "Generating certs for Taky"
		takyctl setup --server_address=${server_address}
		cp /etc/taky/ssl/* /data/ssl/
	fi
fi
#redis
if [ -z "${redis}" ]; then
	echo "Using default redis (false)"
else
	if ${redis} '==' True; then
		redis-server --daemonize yes
	else
		echo "Redis not True and not empty, assuming connection string."
	fi
fi

#Starting taky
#echo "Debug"
#echo " "
#echo "Running the following config"
#echo "$(cat /data/conf/taky.conf)"
#echo " "
echo "Starting taky COT as taky user"
taky -c /data/conf/taky.conf -l debug
