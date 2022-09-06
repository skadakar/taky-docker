#!/bin/sh
echo "Starting taky data package service as taky user"
taky_dps -c /data/conf/taky.conf -l debug
