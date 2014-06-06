# Uaage
# =====
# # assume /tmp/root is your shared directory with this docker
# # assume 20022 is your ssh port for this docker, password: root
# docker run -d -v /tmp/root:/root -p 20022:22 dlin/centos-ssh /usr/sbin/sshd -D
# ssh -p 20022 root@localhost

FROM centos
MAINTAINER Jae Choi <jae.choi@sportsbet.com.au>

RUN yum update -y
RUN ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime

RUN yum install -y openssh-server
RUN /etc/init.d/sshd start
RUN echo 'root:root' | chpasswd

EXPOSE 22

