FROM ubuntu:12.04
MAINTAINER jorge.luis.bonilla@gmail.com

ENV DEBIAN_FRONTEND noninteractive


# 1 - Update apt-get
RUN apt-get update 

#2 Install junos-eznc

RUN apt-get install -y python-pip python-dev libxml2-dev libxslt1-dev
RUN pip install ncclient
RUN pip install junos-eznc 

#3 install  netconify
RUN pip install junos-netconify

#2 Install Ansible
RUN pip install ansible

#3 - Install Junos Galaxy on ansible
RUN ansible-galaxy install Juniper.junos

#4 - Clean up

RUN apt-get clean &&\ 
apt-get purge

