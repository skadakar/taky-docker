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
            common/start-taky-certgen.sh
            
        fi
    #Checks for COT mode:
        #COT
        if [[ "$mode" == "cot" ]]; then
            echo "Starting COT Server";
            common/start-taky-cot.sh
        fi
    #Checks for datapackage service mode:
        #Data
        if [[ "$mode" == "data" ]]; then
            echo "Starting Datapacakage Server";
            common/start-taky-data.sh
        fi    
    fi