FROM ubuntu:20.04

# UTC because everything on a server should be UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

#Setup required stuff
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3 python3-pip python3-lxml python-dateutil gunicorn git crudini redis-server wget

RUN pip3 install flask &&\
    pip3 install pyopenssl &&\
    taky

#Copy scripts
COPY /common/env.sh /env.sh
COPY /taky-cot/start-taky-cot.sh /start-taky-cot.sh
COPY /common/taky.conf /taky.conf



#Setup user
RUN addgroup --gid 1000 taky  &&\
    adduser --disabled-password --uid 1000 --ingroup taky --home /home/taky taky 



#Ports
EXPOSE 8080

VOLUME ["/data"]
ENTRYPOINT ["/bin/bash", "/start-taky-data.sh"]
