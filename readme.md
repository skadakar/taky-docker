## Project 

https://github.com/tkuester/taky

## Images: 

https://hub.docker.com/r/skadakar/taky


## Use
Use -u 1000:1000 to to run as root, make sure 1000:1000 has read/write to whatever you've mapped /data to.

Example for COT:
```
docker run -u 1000:1000 -e bind_ip=0.0.0.0 -e public_ip=123.123.123.123 -v /root/taky-cot:/data -p 8087:8087 -p 8089:8089 -d --name taky-cot skadakar/taky:cot-latest
```
Example for Data
```
docker run -u 1000:1000 -e bind_ip=0.0.0.0 -e public_ip=123.123.123.123 -v /root/taky-data:/data -p 8080:8080 -d --name taky-data skadakar/taky:data-latest
```
Example for cert gen
```
docker run -e ip=123.123.123.123 -v /root/taky:/data -d --name taky-certgen skadakar/taky:certgen-latest
```

If not specified it will use the content of taky.conf

This will default to use /data/ for saving data.

*  *  *  *  *

### Supported env variables:
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
