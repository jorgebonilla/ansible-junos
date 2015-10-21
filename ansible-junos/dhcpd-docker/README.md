### Description
This DockerFile is part of a complete ZeroConf deployment, it provides a DHCP server that will point the new switches to the right initial configuration files and JunOS image

### Prerequisites
Install [docker] (https://docs.docker.com/installation/ "Docker")


### Usage

* Note: This file is automatically built from the main Dockercompose file. You will need to modify a few files before firing it up.

1 Modify the dhcpd.conf file
```
subnet **<subnet>** netmask **<subnetmask>** {
 option domain-name-servers **<domain-server>**;
 option routers **<default-gateway>**;
 pool {
  range dynamic-bootp **<range_initial_ip>** **<range_final_ip>**;
  option OPTION-150 **<ip_of_docker_host>**;

  #Enable the ones that fit your deployment
  allow members of "ex2200-48";
  #allow members of "ex3300-48";
  #allow members of "ex4200-48";
  #allow members of "ex4300-48";

  option NEW_OP.config-file-name "/resources/ex2200/**<your_config_file>**";
  #option NEW_OP.config-file-name "/resources/resources/ex3300/**<your_config_file>**";
  #option NEW_OP.config-file-name "/resources/ex4200/**<your_config_file>**";
  #option NEW_OP.config-file-name "/resources/ex4300/**<your_config_file>**";

  option NEW_OP.image-file-name "/resources/ex2200/**<Junos_Image_Filename>**";
  #option NEW_OP.image-file-name "/resources/ex3300/**<Junos_Image_Filename>**";
  #option NEW_OP.image-file-name "/resources/ex4200/**<Junos_Image_Filename>**";
  #option NEW_OP.image-file-name "/resources/ex43300/**<Junos_Image_Filename>**";
 }
}

```
2 Upload the right images:
```
cd ./ansible-junos/dhcpd-docker/resources/<switch model>/configfile.txt
cd ./ansible-junos/dhcpd-docker/resources/<switch model>/Junos_image_file.tar.gz

```

### Manual Process

1 Build docker image:
```
docker build -t dhcpd_server:0.1 .
```
2 Run Ansible-junos container:
```
docker run -d --net=host dhcpd_server:0.1
```
