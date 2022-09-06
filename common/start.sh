#!/bin/sh
# This script detects the mode the image is running in and starts the relevant service.

echo "Preparing folder structure"
mkdir -p /data/conf
mkdir -p /data/ssl
mkdir -p /data/logs
mkdir -p /data/upload
mkdir -p /data/database

echo "Creating needed folder structure for Taky to work"
chown -R taky:taky /data
chown -R taky:taky /etc/taky
chown -R taky:taky /var/taky


echo "Resetting config file"
cp -f /common/taky.conf /data/conf/taky.conf
echo "Adding env variables"
#Env variable handling
source /common/env.sh

#Check if mode is selected:
    if [ -z "${mode}" ]; then
        echo "No mode selected, see readme";
        exit
    else
    #Checks for certgen mode:
        #Certgen
        if [[ "$mode" == "certgen" ]]; then
            echo "Use docker exec to create certs instead.";
            exit()
        fi
    #Checks for COT mode:
        #COT
        if [[ "$mode" == "cot" ]]; then
            echo "Starting COT Server";
            source /common/start-taky-cot.sh
        fi
    #Checks for datapackage service mode:
        #Data
        if [[ "$mode" == "data" ]]; then
        #Ugly hacks go here
        #FQDN Override
            if [ -z "${fqdnoverride}" ]; then
                echo "No FQDN Override active"
            else
                if [ "$ssl_enabled" = true ] ; then
                    echo "Setting override for SSL use"
                    sed -i '19s/.*/\ \ \ \ return f\"https:\/\/'"${fqdnoverride}"'\/Marti\/sync\/content\?hash\=\{f_hash}\"/' /usr/local/lib/python3.8/dist-packages/taky/dps/views/datapackage.py
                else
                    echo "Setting override for TCP use"
                    sed -i '19s/.*/\ \ \ \ return f\"'"${fqdnoverride}"'\/Marti\/sync\/content\?hash\=\{f_hash}\"/' /usr/local/lib/python3.8/dist-packages/taky/dps/views/datapackage.py
                fi
            fi
            echo "Starting Datapacakage Server";
            source /common/start-taky-data.sh
        fi    
    fi


