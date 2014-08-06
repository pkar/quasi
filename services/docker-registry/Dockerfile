# VERSION 0.1
# DOCKER-VERSION  0.9.1
# AUTHOR:         Paul Karadimas <p@a.com>
# DESCRIPTION:    Image with docker-registry project and dependecies
# TO_BUILD:       docker build -rm -t registry .
# TO_RUN:         docker run -p 5000:5000 registry

FROM ubuntu:14.04

# install required packages 
RUN apt-get install -y git-core wget python-pip python-dev build-essential libevent1-dev python-openssl liblzma-dev

RUN git clone https://github.com/dotcloud/docker-registry /docker-registry

RUN pip install /docker-registry/
RUN mkdir -p /docker-registry/storage

ADD ./boto.cfg /etc/boto.cfg
ADD ./config.yml /docker-registry/config/config.yml
ADD ./gunicorn_config.py /docker-registry/config/gunicorn_config.py
ADD ./config_s3.yml /docker-registry/config/config_s3.yml
ADD ./config_mirror.yml /docker-registry/config/config_mirror.yml

ENV DOCKER_REGISTRY_CONFIG /docker-registry/config/config.yml

EXPOSE 5000

CMD cd /docker-registry && ./setup-configs.sh && exec docker-registry
