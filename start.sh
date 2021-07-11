#!/bin/sh
# This script detects the mode the image is running in and starts the relevant service.

#Check if mode is selected:
    if [ -z "${mode}" ]; then
        echo "No mode selected, see readme";
        exit
    else
    #Checks for certgen mode:
        #Certgen
        if [[ "$mode" == "certgen" ]]; then
            echo "Starting certgen";
            chown +x /common/start-taky-certgen.sh;
            /common/start-taky-certgen.sh
            
        fi
    #Checks for COT mode:
        #COT
        if [[ "$mode" == "cot" ]]; then
            echo "Starting COT Server";
            chown +x /common/start-taky-cot.sh;
            /common/start-taky-cot.sh
        fi
    #Checks for datapackage service mode:
        #Data
        if [[ "$mode" == "data" ]]; then
            echo "Starting Datapacakage Server";
            chown +x /common/start-taky-data.sh;
            /common/start-taky-data.sh
        fi    
    fi
