#!/bin/sh

#SSL
if [ -z "${ssl_enabled}" ]; then
	echo "No SSL configured"
else
	if [ -f "/data/ssl/server.p12" ]; then
    		echo "Certs already configured, skipping."
	else
		echo "Generating certs for Taky"
		takyctl setup
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
taky -c /etc/taky/taky.conf -l debug
