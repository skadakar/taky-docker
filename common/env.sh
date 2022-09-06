import os

# This file will be read before Taky starts.
CONFY=/data/conf/taky.conf

# Variable default values for docker container

hostname = os.getenv("hostname", default="TakyDocker")

node_id = os.getenv("node_id", default="TAKY")

bind_ip = os.getenv("bind_ip", default="0.0.0.0")

public_ip = os.getenv("public_ip", default="0.0.0.0")

redis = os.getenv("redis", default="false")

port = os.getenv("oirt", default="8089")

cot_log = os.getenv("cot_log ", default="/data/logs")

upload_path = os.getenv("upload_path", default="/data/upload")

ssl_enaabled = os.getenv("ssl_enabled", default="true")

client_cert_required = os.getenv("client_cert_required", default="true")

cert = os.getenv("cert", default="/data/ssl/server.crt")

key = os.getenv("key", default="/data/ssl/server.key")

key_pw = os.getenv("key_pw", default="")

ca = os.getenv("ca", default="/data/ssl/ca.crt")

ca_key = os.getenv("ca_key", default="/data/ssl/ca.key")

server_p12 = os.getenv("server_p12", default="/data/ssl/server.p12")

server_p12_key = os.getenv("server_p12_key", default="PoopSecurity")


#hostname
echo "Setting variables for config:"

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

echo "Setting log_cot to ${cot_log}"
crudini --set $CONFY cot_server log_cot ${log_cot}

echo "Setting upload_path to ${upload_path}"
crudini --set $CONFY dp_server upload_path ${upload_path}

echo "Setting ssl_enabled to ${ssl_enabled}"
crudini --set $CONFY ssl enabled ${ssl_enabled}

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

echo "Setting server_p12_key to ${server_p12_key}"
crudini --set $CONFY ssl server_p12_key ${server_p12_key}

echo ""
echo "Variables set"
echo ""
