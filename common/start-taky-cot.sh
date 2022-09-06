#!/bin/sh
if [ -z "${ssl_enabled}" ]; then
	echo "No SSL configured"
else
	if [ -f "/data/ssl/server.p12" ]; then
    		echo "Certs already configured, skipping."
	else
		echo "Generating certs for Taky"
		takyctl setup --public-ip=${public_ip}
		cp /etc/taky/ssl/* /data/ssl/
		exit
	fi
	
fi
#redis
if ${redis} '!=' False; then
	if ${redis} '==' True; then
		echo "Redis must be string or false"
		exit
	fi
	else
	echo "Redis is enabled and will try using the connectionstring" + ${redis}
fi

echo "Starting taky COT as taky user"
taky -c /data/conf/taky.conf -l debug -d
