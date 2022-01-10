FROM debian:bullseye

#Add for psutils to download. 
RUN echo "deb http://ftp.de.debian.org/debian bullseye main"> /etc/apt/sources.list

# UTC because everything on a server should be UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

#Setup required stuff, verbose for debugging reasons. 
RUN apt-get -y update
RUN apt-get -y upgrade

#Required stuff
RUN apt-get install -y python3
RUN apt-get install -y python3-setuptools
RUN apt-get install -y python3-psutil
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-lxml
RUN apt-get install -y gunicorn
RUN apt-get install -y git
RUN apt-get install -y crudini
RUN apt-get install -y redis-server
RUN apt-get install -y python3-openssl


#To sort out some dependency issues with cross platform building
RUN apt-get install -y build-essential 
RUN apt-get install -y libssl-dev 
RUN apt-get install -y libffi-dev 
RUN apt-get install -y python3-dev

RUN pip3 install requests
RUN pip3 install flask

RUN pip3 install -U git+https://github.com/tkuester/taky@next
RUN python3 --version

#Debug tooling
RUN apt-get install -y iputils-ping nmap netcat wget

COPY /start.sh /start.sh
COPY /common/env.sh /common/env.sh
COPY /common/start-taky-cot.sh /common/start-taky-cot.sh
COPY /common/start-taky-data.sh /common/start-taky-data.sh

#Need to remake this to utilize default taky functionality.
COPY /common/start-taky-certgen.sh /common/start-taky-certgen.sh
COPY /common/taky.conf /taky.conf

#Setup user
RUN addgroup --gid 1000 taky  &&\
    adduser --disabled-password --uid 1000 --ingroup taky --home /home/taky taky 

#Folders
RUN mkdir -p /etc/taky
RUN chown 1000 /etc/taky && chgrp 1000 /etc/taky
RUN mkdir -p /var/taky
RUN chown 1000 /var/taky && chgrp 1000 /var/taky
#To run common scripts
RUN chown 1000 -R /common && chgrp 1000 -R /common
#For FQDN hack rights
RUN chown 1000 -R /usr/local/lib/python3.9/dist-packages/taky && chgrp 1000 -R /usr/local/lib/python3.9/dist-packages/taky

# Letting people know it's a docker image for complaining
RUN sed -i '16s/.*/\ \ \ \ \ \ \ \ \ \ \ \ \"version\": f\"taky-\{__version__\} \(Docker image: skadakar\/taky:latest\)\"\,/' /usr/local/lib/python3.9/dist-packages/taky/dps/views/version.py

#Ports
EXPOSE 8087
EXPOSE 8089
EXPOSE 8080
EXPOSE 8443
VOLUME ["/data"]
ENTRYPOINT ["/bin/bash", "/start.sh"]
