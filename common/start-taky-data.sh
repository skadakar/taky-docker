#!/bin/sh

echo "Starting taky data package service as taky user"
taky_dps -c /etc/taky/taky.conf -l debug
