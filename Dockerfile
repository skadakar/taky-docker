FROM debian:bullseye

#Add for psutils to download. 
RUN echo "deb http://ftp.de.debian.org/debian bullseye main"> /etc/apt/sources.list

# UTC because everything on a server should be UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

#Setup required stuff, verbose for debugging reasons. 
RUN apt-get -y update
RUN apt-get -y upgrade

#Required stuff
RUN apt-get install -y python3 python3-setuptools python3-psutil python3-pip python3-lxml gunicorn git crudini redis-server python3-openssl build-essential libssl-dev libffi-dev python3-dev
RUN pip3 install requests flask
#Install Taky
RUN pip3 install -U git+https://github.com/tkuester/taky@next

#Debug tooling, remove if you don't want them.
RUN apt-get install -y iputils-ping nmap netcat wget

#Cleanup
RUN apt-get autoremove

COPY /common/ /common/
COPY /common/taky.conf /data/conf/taky.conf

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
RUN chown 1000 -R /usr/local/lib/python3.9/dist-packages/taky && chgrp 1000 -R /usr/local/lib/python3.9/dist-packages/taky

# Letting people know it's a docker image for complaining
RUN sed -i '16s/.*/\ \ \ \ \ \ \ \ \ \ \ \ \"version\": f\"taky-\{__version__\} \(Docker image: skadakar\/taky:latest\)\"\,/' /usr/local/lib/python3.9/dist-packages/taky/dps/views/version.py

#Ports
EXPOSE 8087
EXPOSE 8089
EXPOSE 8080
EXPOSE 8443
VOLUME ["/data"]
ENTRYPOINT ["/bin/bash", "/common/start.sh"]
