FROM ubuntu:20.04

# UTC because everything on a server should be UTC
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

#Setup required stuff
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3 python3-pip python3-lxml python-dateutil redis gunicorn git crudini

RUN pip3 install flask &&\
    pip3 install pyopenssl
#Folders
RUN mdkir /data &&\
    mdkir /data/logs&&\
    mdkir /data/database &&\
    chmod -R 777 /data

COPY env.sh /env.sh
COPY start-taky.sh /start-taky.sh
RUN echo "#Env variables handled by the docker run command" > /data/taky.conf


#Install Taky
RUN git clone https://github.com/tkuester/taky
RUN chmod -R 777 /taky
RUN cd /taky && python3 ./setup.py install

#Setup user
RUN addgroup --gid 1000 taky && \
    adduser --disabled-password --uid 1000 --ingroup taky --home /home/taky taky
USER taky

#Setup data
VOLUME ["/data"]

ENTRYPOINT ["/bin/bash", "/start-taky.sh"]
