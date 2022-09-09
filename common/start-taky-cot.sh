#!/bin/sh
#redis
if ${redis} != False; then
	if ${redis} '==' True; then
		echo "Redis must be string or false"
		exit
	fi
	else
	echo "Redis is enabled and will try using the connectionstring" + ${redis}
fi
echo "Starting taky COT as taky user"
taky -c /data/conf/taky.conf -l debug -d
