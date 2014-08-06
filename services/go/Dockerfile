# MongoDB
#
# VERSION               0.0.1
#
FROM ubuntu:12.04
MAINTAINER poopypants

RUN apt-get -y update
RUN apt-get -y install wget tar ca-certificates git mercurial gcc libc6-dev make bison binutils python-dev
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py && python get-pip.py
RUN pip install fabric

RUN wget http://golang.org/dl/go1.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.2.linux-amd64.tar.gz
RUN rm go1.3.linux-amd64.tar.gz
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV GOPATH /go
ENV PATH   $PATH:/usr/local/go/bin:$GOPATH/bin

CMD ["go", "env"]
