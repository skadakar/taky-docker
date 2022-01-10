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
		takyctl setup
		cp /etc/taky/ssl/* /data/ssl/
	fi
fi
#redis
if [ -z "${redis}" ]; then
	echo "Using default redis (false)"
else
	if ${redis} '==' false; then
		echo "Redis not configured"
	else
		echo "Redis configured to use $redis"
	fi
fi

echo "Starting taky COT as taky user"
taky -c /data/conf/taky.conf -l debug
