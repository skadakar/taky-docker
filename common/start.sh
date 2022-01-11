#!/bin/sh
# This script detects the mode the image is running in and starts the relevant service.

echo "Creating needed folder structure for Taky to work"
chown -R taky:taky /data
chown -R taky:taky /etc/taky
chown -R taky:taky /var/taky


echo "Resetting config file"
cp -f /taky.conf /data/conf/taky.conf
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
        echo "Starting certgen";
        source /common/start-taky-certgen.sh
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
    #FQDN Override
        echo "Starting Datapacakage Server";
        source /common/start-taky-data.sh
    fi
fi
