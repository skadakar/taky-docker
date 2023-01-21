FROM debian:bullseye

#Fetch updates
RUN apt update
RUN apt upgrade -y

#Setup user
RUN adduser --disabled-password --uid 1000 --gecos "" --shell /bin/bash taky

RUN apt-get install -y python3 python3-setuptools python3-psutil python3-pip python3-lxml gunicorn git crudini redis-server python3-openssl build-essential libssl-dev libffi-dev python3-dev git curl
RUN pip3 install requests flask

#Install Taky
#RUN pip3 install git+https://github.com/tkuester/taky
RUN pip3 install taky

#Debug tooling, remove if you don't want them.
RUN apt-get install -y iputils-ping nmap netcat wget

#Cleanup
RUN apt-get autoremove

COPY /common/ /common/
COPY /common/taky.conf /data/conf/taky.conf


#Folders
RUN mkdir -p /etc/taky
RUN chown 1000 /etc/taky && chgrp 1000 /etc/taky
RUN mkdir -p /var/taky
RUN chown 1000 /var/taky && chgrp 1000 /var/taky
#To run common scripts
RUN chown 1000 -R /common && chgrp 1000 -R /common
RUN chown 1000 -R /usr/local/lib/python3.9/dist-packages/taky && chgrp 1000 -R /usr/local/lib/python3.9/dist-packages/taky

#Ports
EXPOSE 8087
EXPOSE 8089
EXPOSE 8080
EXPOSE 8443
VOLUME ["/data"]
ENTRYPOINT ["/bin/bash", "/common/start.sh"]
