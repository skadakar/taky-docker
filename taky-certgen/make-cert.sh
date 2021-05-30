#/bin/sh
if
  echo "IP = ${ip}"
  echo "Password = ${password}"
  echo "Running ATAK of the cert"
  curl -L https://git.io/JL9DP | python3 - -a -c /data/ssl -i ${ip}
  echo "Finished creating certs"
  exit()
else
  exit(Fuck!)
