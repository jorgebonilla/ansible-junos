# Ansible-junos
Dockerfile to deploy Ansible on Ubuntu 12.04 + ansible + pyez-nc

### Prerequisites
Install [docker] (https://docs.docker.com/installation/ "Docker")

###Usage

### From docker hub
1 Download the docker image from hub.docker.com
```
docker pull jorgebonilla/ansible-junos
```
2 Run Ansible-junos container:
```
docker run -it jorgebonilla/ansible-junos bash
```
See optional steps below.

###To build from source

1 Download from git repository
```
git clone https://github.com/jorgebonilla/ansible-junos.git
cd ansible-junos
```
2 Build docker image:
```
docker build -t ansible-junos:0.1 .
```
3 Run Ansible-junos container:
```
docker run -it ansible_junos:0.1 bash
```

####Optional 

4 Load the example host file and modify accordingly 
```
root@8834f7426e1a:/# cp /tmp/example/etc/ansible/hosts /etc/ansible/hosts
```
5 Run test playbook:
 ```
root@8834f7426e1a:/# ansible-playbook /tmp/example/TestPlaybook.yml
 ```
 
If this was helpfull to you in anyway, please feel free to drop a tip @ [1GkYUGuqgXaV2dpdkZAC97ytYaKRFKdVqT](bitcoin:1GkYUGuqgXaV2dpdkZAC97ytYaKRFKdVqT "Bitcoin Address")
