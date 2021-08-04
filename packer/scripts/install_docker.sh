#!/bin/bash
#set -e
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update -y
apt-cache policy -y docker-ce
sudo apt install -y docker-ce
sudo groupadd docker
sudo usermod -aG docker ${USER}
