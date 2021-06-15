#!/bin/bash
#set -e
sudo apt-get -y update 
sudo apt-get install -y openjdk-8-jre   
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get -y update 
sudo apt-get -y install jenkins 
