#Folder creation
echo "Debug"
ls -la /data/
echo "whomai"
whoami
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
