## Project 

https://github.com/tkuester/taky



## Images: 
https://github.com/skadakar/taky-docker/

https://hub.docker.com/r/skadakar/taky

## Tags

Current images are built on Debian Bullseye instead of ubuntu for better single board computer support.

Latest is the newest image, potentially unstable.

Version specifics are manual builds based on pip installer with corresponding version numbers.



## Use
Use -u 1000:1000 to avoid running as root, make sure 1000:1000 has read/write to whatever you've mapped /data to.

Example for COT:
```
docker run -u 1000:1000 -e mode=cot -e bind_ip=0.0.0.0 -e public_ip=123.123.123.123 -v /root/taky-cot:/data -p 8087:8087 -p 8089:8089 -d --name taky-cot skadakar/taky:latest
```
Example for Data
```
docker run -u 1000:1000 -e mode=data -e bind_ip=0.0.0.0 -e public_ip=123.123.123.123 -v /root/taky-data:/data -p 8080:8080 -d --name taky-data skadakar/taky:latest
```

Example for client package generation:
```
docker exec taky-cot bash -c "cd /data/; takyctl -c /data/conf/taky.conf build_client --is_itak itak"
docker exec taky-cot bash -c "cd /data/; takyctl -c /data/conf/taky.conf build_client atak"
```

This will default to use /data/ for saving data.

*  *  *  *  *

### Supported env variables:
### Mode
|Variable|Value|
|-----|----|
|Mode|cot/data|
 
This lets you decide what service to start while only needing one image, adhering to taky's structure and clean docker implementation practice. 

### TAKY
|Variable|Type|
|-----|----|
|hostname|string|
|node_id||string|
|bind_ip|string|
|public_ip|string|
|redis|redis connection string|

### COT SERVER
|Variable|Type|
|-----|----|
|port|num|
|log_cot|string(path)|
|cot_log|bool|
|mon_ip|string|
|mon_port|num|
|max_persist_ttl|num (-1 default)|

### DATAPACKAGE SERVER
|Variable|Type|
|-----|----|
|upload_path|string|
|fqdnoverride|string|

### SSL
|Variable|Type|
|-----|----|
|ssl_enabled|bool|
|client_cert_required|bool|
|cert|
|key|
|key_pw|
|ca|
|ca_key|
|server_p12|
|server_p12_key|
*  *  *  *  *

## Non standard operators

fqdnoverride takes sub.domain.org:1234 as input, this lets you have datapackages go on custom ports and domains.

## Current hacks

FQDN override for datapackages should not be needed in the future

SSL/TCP for datapackages is hacked in the in start.sh for FQDN override.


