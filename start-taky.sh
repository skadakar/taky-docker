#Setting folder stuff
chmod -R 777 /data
touch /data/taky.conf

#Env handling
echo "Adding variables to relevant config files"
source fts.sh
echo "Starting taky"
#Print version because..
taky --version


#Starting taky
taky -c /data/taky.conf -l debug
