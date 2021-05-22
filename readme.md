Docker image for this project https://github.com/tkuester/taky

Supported env variables:

| TAKY|||
|-----|----|----|
||hostname||
||node_id||
||bind_ip|
||public_ip|
| COT SERVER||
||port
||cot_log
|| DATAPACKAGE SERVER||
||upload_path
| SSL||
||ssl_enabled|true/false|
||client_cert_required|true/false|
||cert|
||key|
||key_pw|
||ca|
||ca_key|
||server_p12|
||server_p12_key|

If not specified it will use the content of taky.conf
This will default to use /data/ for saving data.
