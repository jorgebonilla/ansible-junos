FROM ubuntu:12.04
MAINTAINER jorge.luis.bonilla@gmail.com

# 1 - Update apt-get
RUN apt-get update

#2 Install isc-dhcp-server
RUN apt-get install -y isc-dhcp-server

#3 - Clean up
RUN apt-get clean &&\
apt-get purge

#4 - Ports
EXPOSE 67/udp 68/udp

#5 - Copy configuration file
COPY ./dhcpd.conf /etc/dhcp/dhcpd.conf
RUN chmod 777 var/lib/dhcp/dhcpd.leases

#6 - Run DHCPD
ENTRYPOINT ["dhcpd"]
CMD ["-f", "-cf", "/etc/dhcp/dhcpd.conf", "--no-pid", "eth0"]
