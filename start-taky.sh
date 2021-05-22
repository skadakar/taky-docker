#!/bin/sh
echo "chownhack"
chown -R taky:taky /data
exec runuser -u taky "$@"

echo "Debug"
ls -la /data/
echo "whomai"
whoami
echo "touching things"
mkdir -p /data/conf
mkdir -p /data/ssl
mkdir -p /data/logs
mkdir -p /data/upload
touch /data/conf/taky.conf


#Env handling
echo "Adding variables to relevant config files"
source env.sh

#Print version because..
echo "Taky version:"
taky --version

echo "Starting taky"
#Starting taky
taky -c /data/conf/taky.conf -l debug
