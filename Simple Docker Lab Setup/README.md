# Simple Docker Lab Setup

### Objective
This document describes the procedure I've followed and resources I've used to setup a simple docker network populated with N Arch Linux containers for the purpose of
networking related studies (iptables setup, tc, tunneling etc) on top a Arch Linux host. 

### Procedure

#### Docker Installation
Docker installation:
> pacman -S docker

Starting docker service:
> systemctl start docker.service

Checking docker service status (shall be active):
> systemctl status docker.service

Setting docker service to be started at boot:
> systemctl enable docker.service

Testing docker setup (shall print "hello friend" on the screen)
> docker run -it --rm archlinux bash -c "echo hello friend"

#### Archlinux Image Setup
Get files and scripts to build Arch Linux Docker Image:
> git clone https://github.com/archlinux/archlinux-docker.git

Install tools to build
> pacman -S devtools make fakeroot fakechroot 

Build docker image
> make archlinux-docker/docker-image

Check image
> docker images ls
It shall list an image called archlinux/base

Run docker image
> docker run -it archlinux/base 

The base image is ready but it contains a very minimal installation of Arch, which means most tools are no installed. 
For the sake of practicity I've decide to install all tools that the Arch live system comes with.

Get list of arch live system packages
> wget https://gitlab.archlinux.org/archlinux/archiso/-/raw/master/configs/releng/packages.x86_64

Remove comments from file
> sed '/#/d' packages.x86_64 > packages

Install packages from file with pacman
> pacman -S --noconfirm - < packages

Exit docker
> exit

Save changes made on the container to the image
> docker commit <container_id> archlinux/full


#### Setup Docker Network
Create a docker subnet
> docker network create --subnet=10.0.0.0/24 testnet

To connect the docker to the created network all is necessary is to pass the following flag to the docker run command:
> --net testnet

#### Setup script to keep docker containers alive
A docker terminates as soon as the task it was spawned for terminates, therefore, one way to keep the docker alive is 
to create a dummy script that has a infinite loop, such as the one below:

```bash
#!/bin/bash
# /home/root/arch1/keepalive.sh
while true
do sleep 1000
done
```

To make the docker run the above script, all that is needed is to bind a folder inside the docker with folder where keepalive.sh is saved and
to execute the script as the docker run command. 
> docker run -v "/home/root/arch1":"/home/arch1" archlinux/full sh /home/arch1/keepalive.sh





