#Folder creation
mkdir -p /data/conf
mkdir -p /data/logs
mkdir -p /data/database

#Env handling
echo "Adding variables to relevant config files"
source env.sh
echo "Starting taky"

#Print version because..
taky --version

#Starting taky
taky -c /data/conf/taky.conf -l debug
