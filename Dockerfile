#This is just to get https://github.com/lennisthemenace/ATAK-Certs into a docker image. 
FROM ubuntu:20.04

# UTC because everything on a server should be UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

#Setup required stuff
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential libssl-dev libffi-dev python-dev
RUN apt-get -y install python3 python3-pip python3-lxml python-dateutil gunicorn gcc git crudini redis-server wget
RUN pip3 install pyopenssl requests flask 

#RUN pip3 install taky
RUN apt-get -y install git
RUN git clone https://github.com/tkuester/taky && taky $ python3 setup.py install

#Debug tooling
RUN apt-get -y install iputils-ping nmap netcat

COPY /start.sh /start.sh
COPY /common/env.sh /common/env.sh
COPY /common/start-taky-cot.sh /common/start-taky-cot.sh
COPY /common/start-taky-data.sh /common/start-taky-data.sh
COPY /common/start-taky-certgen.sh /common/start-taky-certgen.sh
COPY /common/hackofthecert.py /common/hackofthecert.py
COPY /common/taky.conf /taky.conf

#Folders
RUN mkdir -p /etc/taky
RUN chown 1000 /etc/taky && chgrp 1000 /etc/taky
RUN mkdir -p /var/taky
RUN chown 1000 /var/taky && chgrp 1000 /var/taky
#To run common scripts
RUN chown 1000 -R /common && chgrp 1000 -R /common
#For FQDN hack rights
RUN chown 1000 -R /usr/local/lib/python3.8/dist-packages/taky && chgrp 1000 -R /usr/local/lib/python3.8/dist-packages/taky

#Setup user
RUN addgroup --gid 1000 taky  &&\
    adduser --disabled-password --uid 1000 --ingroup taky --home /home/taky taky 

# Letting people know it's a docker image for complaining
RUN sed -i '16s/.*/\ \ \ \ \ \ \ \ \ \ \ \ \"version\": f\"taky-\{__version__\} \(Docker image: skadakar\/taky\)\"\,/' /usr/local/lib/python3.8/dist-packages/taky/dps/views/version.py

#Ports
EXPOSE 8087
EXPOSE 8089
EXPOSE 8080
EXPOSE 8443

VOLUME ["/data"]
ENTRYPOINT ["/bin/bash", "/start.sh"]
