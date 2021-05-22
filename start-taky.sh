#!/bin/sh
echo "chownhack"
chown -R taky:taky /data

echo "Preparing folder structure"
mkdir -p /data/conf
mkdir -p /data/ssl
mkdir -p /data/logs
mkdir -p /data/upload
echo "Resetting config file"
cp -f /taky.conf /data/conf/taky.conf


#Env handling
echo "Adding variables to relevant config files"
source env.sh


#Starting taky
echo "Starting taky as taky user"
exec runuser taky -c "taky -c /data/conf/taky.conf -l debug"
