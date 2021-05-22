#Folder creation
echo "Creating folders"
mkdir -p /data/conf
mkdir -p /data/logs
mkdir -p /data/database

#Env handling
echo "Adding variables to relevant config files"
bash -c "echo \"#PruningConfig\" > /data/conf/taky.conf"
source env.sh

#Print version because..
echo "Taky version:"
taky --version

echo "Starting taky"
#Starting taky
taky -c /data/conf/taky.conf -l debug
