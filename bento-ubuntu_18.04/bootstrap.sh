#!/bin/bash

# Reminder: this script is executed as root, at the boot of the machine

# install git, curl and docker
apt-get update
apt-get upgrade -y
#apt-get -y install git curl

# install docker
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent \
    software-properties-common
curl curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    bionic stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

systemctl enable docker && systemctl start docker
usermod -aG docker vagrant


# create user 'thierry' (pwd='') with sudo privilege
adduser --disabled-password --gecos "" thierry
usermod -aG sudo thierry
usermod -aG docker thierry

