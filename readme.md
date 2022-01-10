## Project 

https://github.com/tkuester/taky

## Images: 

https://hub.docker.com/r/skadakar/taky


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
Example for cert gen (depricated soon i hope)
```
docker run -e mode=certgen -e public_ip=123.123.123.123 -v /root/taky:/data -d --name taky-certgen skadakar/taky:latest
```

If not specified it will use the content of taky.conf

This will default to use /data/ for saving data.

*  *  *  *  *

### Supported env variables:
### Mode
|Variable|Value|
|-----|----|
|Mode|cot/data/certgen|
 
This lets you decide what service to start while only needing one image, adhering to taky's structure and clean docker implementation practice. 

### TAKY
|Variable|Type|Default|
|-----|----|----|
|server_address|string||
|node_id|string|taky|
|bind_ip|string|0.0.0.0|
|redis|connection string|false|

### COT SERVER
|Variable|Type|Default|
|-----|----|----|
|port|num|TCP 8087 SSL 8089|
|log_cot|string(path)|/data/logs|
|cot_log|bool|false|

### DATAPACKAGE SERVER
|Variable|Type|Default|
|-----|----|----|
|upload_path|string|/data/upload|

### SSL
|Variable|Type|Default|
|-----|----|----|
|ssl_enabled|bool|false|
|client_cert_required|bool|false
|cert|file|/data/ssl/server.crt|
|key|file|/data/ssl/server.key|
|key_pw|string||
|ca|file|/data/ssl/ca.crt|
|ca_key||
|server_p12|file|/data/ssl/server.p12|
|server_p12_key|string|PoopSecurity|
*  *  *  *  *


