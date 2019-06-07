#!/bin/bash
echo "If you have docker installed: we need to remove it --------------------------- "
sleep 1
sudo apt-get remove -y docker docker-engine docker.io containerd runc
echo "Add the docker repositories ---------------------------"
sleep 1
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "Install docker and add docker user configuration ---------------------------"
sleep 1
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}
sudo docker run hello-world