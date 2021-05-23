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
REDIS_CONF=/home/taky/redis/redis-6.2.3/redis.conf
if [ -z "${redis}" ]; then
	echo "Using default redis (false)"
else
	crudini --set $REDIS_CONF daemonize yes
  	crudini --set $REDIS_CONF dir /data/database
	crudini --set $REDIS_CONF logfile /data/logs/redis.log
	runuser taky -c "/home/taky/redis/redis-6.2.3/src/./redis-server /home/taky/redis/redis-6.2.3/redis.conf &"
fi

#Env handling
echo "Adding variables to relevant config files"
source env.sh


#Starting taky
echo "Starting taky as taky user"
runuser taky -c "taky -c /data/conf/taky.conf -l debug"
