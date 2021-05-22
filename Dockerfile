FROM ubuntu:20.04

# UTC because everything on a server should be UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

#Setup required stuff
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3 python3-pip python3-lxml python-dateutil redis gunicorn git crudini

RUN pip3 install flask &&\
    pip3 install pyopenssl

#Copy scripts
COPY env.sh /env.sh
COPY start-taky.sh /start-taky.sh

#Install Taky
RUN git clone https://github.com/tkuester/taky
RUN chmod -R 777 /taky
RUN cd /taky && python3 ./setup.py install

#Setup user
RUN addgroup --gid 1000 taky  &&\
    adduser --disabled-password --uid 1000 --ingroup taky --home /home/taky taky 

#Setup data
#Permissions
USER root
RUN mkdir -p /data
RUN chown -R taky:taky /data
USER taky
#Ports
EXPOSE 8087
EXPOSE 8089

VOLUME ["/data"]
ENTRYPOINT ["/bin/bash", "/start-taky.sh"]
