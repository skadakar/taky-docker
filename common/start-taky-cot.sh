#!/bin/sh
if [ -z "${ssl_enabled}" ]; then
	echo "No SSL configured"
else
	if [ -f "/data/ssl/ca.crt" ]; then
    		echo "Certs already configured, skipping."
	else
		echo "Generating certs for Taky"
		takyctl setup --p12_pw=$server_p12_pw --host=${hostname}  --bind-ip=${bind_ip} --public-ip=${public_ip}
		cp /etc/taky/ssl/* /data/ssl/
		echo "Certificates created, will exit out and restart."
		exit
	fi

fi
#redis
if ${redis} != False; then
	if ${redis} '==' true; then
		echo "Redis will run in the background, this is not ideal but it does work."
		echo "Proper way of doing it is to use a dedicated redis and insert the connection string."
		redis-server --daemonize yes
	fi
	else
	echo "Redis is enabled and will try using the connectionstring" + ${redis}
fi
echo "Starting taky COT as taky user"
taky -c /data/conf/taky.conf -l debug -d
