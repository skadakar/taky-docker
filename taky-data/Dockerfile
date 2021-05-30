FROM ubuntu:20.04

# UTC because everything on a server should be UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

#Setup required stuff
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3 python3-pip python3-lxml python-dateutil gunicorn git crudini redis-server wget

RUN pip3 install flask &&\
    pip3 install pyopenssl

#Copy scripts
COPY /common/env.sh /env.sh
COPY /taky-data/start-taky-data.sh /start-taky-data.sh
COPY /common/taky.conf /taky.conf

#Install Taky
RUN git clone https://github.com/tkuester/taky
RUN chmod -R 777 /taky
RUN cd /taky && python3 ./setup.py install

#Setup user
RUN addgroup --gid 1000 taky  &&\
    adduser --disabled-password --uid 1000 --ingroup taky --home /home/taky taky 



#Ports
EXPOSE 8080

VOLUME ["/data"]
ENTRYPOINT ["/bin/bash", "/start-taky-data.sh"]
