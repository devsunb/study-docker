FROM centos:7.7.1908
MAINTAINER Jaeseok Lee <jaeseoklee00@gmail.com>

RUN yum install -y openssh-server openssl
RUN rpm -Uvh http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
RUN yum install -y vim ssh gcc gcc-c++ git
RUN ssh-keygen -q -b 1024 -N '' -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -b 1024 -N '' -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -b 521 -N '' -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -q -b 521 -N '' -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
RUN usermod --password $(openssl passwd -1 defaultpass) root
RUN echo /usr/sbin/sshd >> /root/.bashrc

RUN yum clean all && \
    yum clean metadata && \
	rm -rf /var/cache/yum/*

ENTRYPOINT /bin/bash
