#Folder creation
echo "Creating folders"
mkdir -p /data/conf
mkdir -p /data/logs
mkdir -p /data/database

echo "Setting folder permissions"
chmod -R 777 /data

#Env handling
echo "Adding variables to relevant config files"
source env.sh

#Print version because..
echo "Taky version:"
taky --version

echo "Starting taky"
#Starting taky
taky -c /data/conf/taky.conf -l debug
