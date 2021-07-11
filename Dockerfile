#This is just to get https://github.com/lennisthemenace/ATAK-Certs into a docker image. 
FROM ubuntu:20.04

# UTC because everything on a server should be UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

#Setup required stuff
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3 python3-pip python3-lxml python-dateutil gunicorn git crudini redis-server wget
RUN pip3 install pyopenssl requests flask taky

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
RUN chown 1000 /common && chgrp 1000 /common

#Setup user
RUN addgroup --gid 1000 taky  &&\
    adduser --disabled-password --uid 1000 --ingroup taky --home /home/taky taky 

#Ports
EXPOSE 8087
EXPOSE 8089
EXPOSE 8080
VOLUME ["/data"]
ENTRYPOINT ["/bin/bash", "/start.sh"]
