## Project 

https://github.com/tkuester/taky

## Images: 

https://hub.docker.com/r/skadakar/taky


## Use
Use -u 1000:1000 to avoid running as root, make sure 1000:1000 has read/write to whatever you've mapped /data to.

Example for COT:
```
docker run -u 1000:1000 -e mode=cot -e bind_ip=0.0.0.0 -e public_ip=123.123.123.123 -v /root/taky-cot:/data -p 8087:8087 -p 8089:8089 -d --name taky-cot skadakar/takt:unified
```
Example for Data
```
docker run -u 1000:1000 -e mode=data -e bind_ip=0.0.0.0 -e public_ip=123.123.123.123 -v /root/taky-data:/data -p 8080:8080 -d --name taky-data skadakar/taky:unified
```
Example for cert gen (depricated soon i hope)
```
docker run -e mode=certgen -e public_ip=123.123.123.123 -v /root/taky:/data -d --name taky-certgen skadakar/taky:unified
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
|Variable|Type|
|-----|----|
|hostname||
|node_id||
|bind_ip|
|public_ip|
|public_ip|bool|
|redis|bool or connection string|

### COT SERVER
|Variable|Type|
|-----|----|
|port
|cot_log
| DATAPACKAGE SERVER||
|upload_path
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

# TODO:

SSL generation on startup?
 
SSL generation as it's own thing? 
