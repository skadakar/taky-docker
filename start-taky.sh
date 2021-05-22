#Setting folder stuff
chmod -R 777 /data

#Env handling
echo "Adding variables to relevant config files"
source fts.sh
echo "Starting taky"


#Starting taky
taky
