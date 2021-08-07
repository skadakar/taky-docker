#/bin/sh
echo "IP = ${ip}"
echo "Password = ${password}"
echo "Running ATAK of the cert"
chmod -x /common/hackofthecert.py
yes | python3 hackofthecert.py - -c -i ${public_ip}
cp *.p12 /data/ssl/
cp *.pem /data/ssl/
cp *.key* /data/ssl/
echo "Finished creating certs"
exit()
