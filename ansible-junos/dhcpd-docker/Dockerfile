FROM ubuntu:12.04
MAINTAINER jorge.luis.bonilla@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# 1 - Update apt-get
RUN apt-get update

#2 Install isc-dhcp-server and FTP Server
RUN apt-get install -y isc-dhcp-server vsftpd supervisor

#3 - Clean up
RUN apt-get clean &&\
apt-get purge

#4 - Ports
EXPOSE 21/tcp
EXPOSE 67/udp 68/udp

#5 - Copy configuration file
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
RUN chmod 777 var/lib/dhcp/dhcpd.leases

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD ./resources /srv/ftp/resources


#6 - Run DHCPD and VSFTP under supervisor
CMD ["/usr/bin/supervisord"]
