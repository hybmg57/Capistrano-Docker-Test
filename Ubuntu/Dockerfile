# sshd
#
# VERSION               0.0.1

FROM     ubuntu
MAINTAINER Jae Choi "jae.choi@sportsbet.com.au"

RUN locale-gen en_AU
RUN update-locale LANG=en_AU

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN apt-get install -y git-core

RUN echo 'root:pass' |chpasswd

EXPOSE 22
CMD    /usr/sbin/sshd -D
