# MongoDB for internal server deploy, needs numactl, remove for non numa machines
#
# VERSION               0.0.1
#
FROM ubuntu:14.04
MAINTAINER poopypants

# make sure the package repository is up to date
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install mongodb-org

RUN apt-get install -y numactl

EXPOSE 27017
ENTRYPOINT ["/usr/bin/numactl", "--interleave=all", "mongod", "-f", "/data/mongodb.conf"]
#ENTRYPOINT ["mongod", "-f", "/data/mongodb.conf"]

