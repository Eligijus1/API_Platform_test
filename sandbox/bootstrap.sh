#!/usr/bin/env bash

echo "# IPv4 and IPv6 localhost aliases:" | sudo tee /etc/hosts
echo "127.0.0.1     api.platform.test.com  api.platform.test  localhost" | sudo tee -a /etc/hosts
echo "::1           api.platform.test.com  api.platform.test  localhost" | sudo tee -a /etc/hosts
echo "172.28.128.19 api.platform.test.com  api.platform.test  localhost" | sudo tee -a /etc/hosts

# Update packages:
sudo apt-get update

# Install nmap:
sudo apt-get install -y nmap

# Add DNS to /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# Install git:
sudo apt-get install -y git

##
## Install Docker:
##

# 1. Update your existing list of package:
sudo apt update

# 2. Install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# 3. Add the GPG key for the official Docker repository to system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 4. Add the Docker repository to APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# 5. Update the package database with the Docker packages from the newly added repo:
sudo apt update

# 6. Make sure about to install from the Docker repo instead of the default Ubuntu repo:
apt-cache policy docker-ce

# 7. Install Docker:
sudo apt install -y docker-ce

# 8. Check that Docker running:
sudo systemctl status docker

# 9. To avoid typing sudo, add 'vagrant' user to the 'docker' group:
#sudo usermod -aG docker ${USER}
sudo usermod -aG docker vagrant

# NOTE: after logout, login to vagrant user command `id -nG` should show 'vagrant docker'.

# 10: Install docker-compose:
sudo apt install -y docker-compose

##
## Install jq to nice view json:
##
sudo apt install -y jq