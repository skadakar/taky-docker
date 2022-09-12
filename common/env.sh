#!/bin/sh
# This file will be read before Taky starts.
CONFY=/data/conf/taky.conf

ip4=$(curl ifconfig.io/ip)


# Variable default values for docker container
[  -z "$hostname" ] && hostname="TakyDocker"

[  -z "$node_id" ] && node_id="TAKY"

[  -z "$bind_ip" ] && bind_ip="0.0.0.0"

[  -z "$public_ip" ] && public_ip=$ip4

[  -z "$redis" ] && redis=false

[  -z "$port" ] && port=8089

[  -z "$log_cot" ] && log_cot="/data/logs"

[  -z "$cot_log" ] && cot_log=true

[  -z "$mon_ip" ] && mon_ip="127.0.0.1"

[  -z "$mon_port" ] && mon_port=8087

[  -z "$max_persist_ttl" ] && max_persist_ttl=-1

[  -z "$upload_path" ] && upload_path="/data/upload"

[  -z "$ssl_enabled" ] && ssl_enabled=true

[  -z "$client_cert_required" ] && client_cert_required=true

[  -z "$cert_db" ] && cert_db="/data/ssl/"

[  -z "$cert" ] && cert="/data/ssl/server.crt"

[  -z "$key" ] && key="/data/ssl/server.key"

[  -z "$key_pw" ] && key_pw="CanYouBeliveTheyDidntChangeTheDefaultPassword"

[  -z "$ca" ] && ca="/data/ssl/ca.crt"

[  -z "$ca_key" ] && ca_key="/data/ssl/ca.key"

[  -z "$server_p12" ] && server_p12="/data/ssl/server.p12"

[  -z "$server_p12_pw" ] && server_p12_pw="PoopSecurity"


#hostname
echo ""
echo "Setting variables for config:"
echo ""

echo "Setting hostname to ${hostname}"
crudini --set $CONFY taky hostname ${hostname}

echo "Setting node_id to ${node_id}"
crudini --set $CONFY taky node_id ${node_id}

echo "Setting bind_ip to ${bind_ip}"
crudini --set $CONFY taky bind_ip ${bind_ip}

echo "Setting public_ip to ${public_ip}"
crudini --set $CONFY taky public_ip ${public_ip}

echo "Setting redis to ${redis}"
crudini --set $CONFY taky redis ${redis}

echo "Setting port to ${port}"
crudini --set $CONFY cot_server port ${port}

echo "Setting log_cot to ${log_cot}"
crudini --set $CONFY cot_server log_cot ${log_cot}

echo "Setting cot_log to ${cot_log}"
crudini --set $CONFY cot_server cot_log ${cot_log}

echo "Setting mon_ip to ${mon_ip}"
crudini --set $CONFY cot_server mon_ip ${mon_ip}

echo "Setting mon_port to ${mon_port}"
crudini --set $CONFY cot_server mon_port ${mon_port}

echo "Setting max_persist_ttl to ${max_persist_ttl}"
crudini --set $CONFY cot_server max_persist_ttl ${max_persist_ttl}

echo "Setting upload_path to ${upload_path}"
crudini --set $CONFY dp_server upload_path ${upload_path}

echo "Setting ssl_enabled to ${ssl_enabled}"
crudini --set $CONFY ssl enabled ${ssl_enabled}

echo "Setting cert_db to ${cert_db}"
crudini --set $CONFY ssl cert_db ${cert_db}

echo "Setting client_cert_required to ${client_cert_required}"
crudini --set $CONFY ssl client_cert_required ${client_cert_required}

echo "Setting cert to ${cert}"
crudini --set $CONFY ssl cert ${cert}

echo "Setting key to ${key}"
crudini --set $CONFY ssl key ${key}

echo "Setting key_pw to ${key_pw}"
crudini --set $CONFY ssl key_pw ${key_pw}

echo "Setting ca to ${ca}"
crudini --set $CONFY ssl ca ${ca}

echo "Setting ca_key to ${ca_key}"
crudini --set $CONFY ssl ca_key ${ca_key}

echo "Setting server_p12 to ${server_p12}"
crudini --set $CONFY ssl server_p12 ${server_p12}

echo "Setting server_p12_pw to ${server_p12_pw}"
crudini --set $CONFY ssl server_p12_pw ${server_p12_pw}

echo ""
echo "Variables set"
echo ""
