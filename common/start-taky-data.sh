#!/bin/sh
echo "chownhack"
chown -R taky:taky /data

echo "Preparing folder structure"
mkdir -p /data/conf
mkdir -p /data/ssl
mkdir -p /data/logs
mkdir -p /data/upload
mkdir -p /data/upload/meta
mkdir -p /data/database

echo "Starting taky data package service as taky user"
taky_dps -c /data/conf/taky.conf -l debug
