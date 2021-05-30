#This is just to get https://github.com/lennisthemenace/ATAK-Certs into a docker image. 
FROM 3.8.10-slim-buster

# UTC because everything on a server should be UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

#Setup required stuff
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3 python3-pip curl 
RUN pip3 install pyopenssl 

COPY /taky-certgen/make-cert.sh /make-cert.sh

VOLUME ["/data"]
ENTRYPOINT ["/bin/bash", "/make-cert.sh"]
