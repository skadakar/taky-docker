# This file will be read before Taky starts.
#
CONFY=/data/conf/taky.conf

#TAKY
#hostname
if [ -z "${hostname}" ]; then
	echo "Using default hostname"
else
	echo "Setting hostname to ${hostname}"
	crudini --set $CONFY taky hostname ${hostname}
fi

#node_id
if [ -z "${node_id}" ]; then
	echo "Using default node_id"
else
	echo "Setting node_id to ${node_id}"
	crudini --set $CONFY taky node_id ${node_id}
fi

#bind_ip
if [ -z "${bind_ip}" ]; then
	echo "Using default bind_ip"
else
	echo "Setting bind_ip to ${bind_ip}"
	crudini --set $CONFY taky bind_ip ${bind_ip}
fi

#public_ip
if [ -z "${public_ip}" ]; then
	echo "Using default public_ip"
else
	echo "Setting public_ip to ${public_ip}"
	crudini --set $CONFY taky public_ip ${public_ip}
fi

#redis
if [ -z "${redis}" ]; then
	echo "Using default redis (false)"
else
	echo "Setting redis to ${redis}"
	crudini --set $CONFY taky redis ${redis}
fi


#COT SERVER
#port
if [ -z "${port}" ]; then
	echo "Using default port"
else
	echo "Setting port to ${port}"
	crudini --set $CONFY cot_server port ${port}
fi

#cot_log
if [ -z "${cot_log}" ]; then
	echo "Using default cot_log"
else
	echo "Setting cot_log to ${cot_log}"
	crudini --set $CONFY cot_server cot_log ${cot_log}
fi

#DATAPACKAGE SERVER
#upload_path
if [ -z "${upload_path}" ]; then
	echo "Using default upload_path"
else
	echo "Setting upload_path to ${upload_path}"
	crudini --set $CONFY dp_server upload_path ${upload_path}
fi

#SSL
#ssl_enabled
if [ -z "${ssl_enabled}" ]; then
	echo "Using default ssl_enabled"
else
	echo "Setting ssl_enabled to ${ssl_enabled}"
	crudini --set $CONFY ssl enabled ${ssl_enabled}
fi

#client_cert_required
if [ -z "${client_cert_required}" ]; then
	echo "Using default client_cert_required"
else
	echo "Setting client_cert_required to ${client_cert_required}"
	crudini --set $CONFY ssl client_cert_required ${client_cert_required}
fi

#cert
if [ -z "${cert}" ]; then
	echo "Using default cert"
else
	echo "Setting cert to ${cert}"
	crudini --set $CONFY ssl cert ${cert}
fi

#key
if [ -z "${key}" ]; then
	echo "Using default key"
else
	echo "Setting key to ${key}"
	crudini --set $CONFY ssl key ${key}
fi

#key_pw
if [ -z "${key_pw}" ]; then
	echo "Using default key_pw"
else
	echo "Setting key_pw to ${key_pw}"
	crudini --set $CONFY ssl key_pw ${key_pw}
fi

#ca
if [ -z "${ca}" ]; then
	echo "Using default ca"
else
	echo "Setting ca to ${ca}"
	crudini --set $CONFY ssl ca ${ca}
fi

#ca_key
if [ -z "${ca_key}" ]; then
	echo "Using default ca_key"
else
	echo "Setting ca_key to ${ca_key}"
	crudini --set $CONFY ssl ca_key ${ca_key}
fi

#server_p12
if [ -z "${server_p12}" ]; then
	echo "Using default server_p12"
else
	echo "Setting server_p12 to ${server_p12}"
	crudini --set $CONFY ssl server_p12 ${server_p12}
fi

#server_p12_key
if [ -z "${server_p12_key}" ]; then
	echo "Using default server_p12_key"
else
	echo "Setting server_p12_key to ${server_p12_key}"
	crudini --set $CONFY ssl server_p12_key ${server_p12_key}
fi

