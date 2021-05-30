#/bin/sh
echo "IP = ${ip}"
echo "Password = ${password}"
echo "Running ATAK of the cert"
curl -L https://git.io/JL9DP | python3 - -c -i ${public_ip}
cp *.p12 /data/ssl/
cp *.pem /data/ssl/
cp *.key* /data/ssl/
echo "Finished creating certs"
exit()
