#!/bin/bash
echo "If you have docker installed: we need to remove it --------------------------- "
sleep 1
sudo apt-get remove -y docker docker-engine docker.io containerd runc

echo "Add the docker repositories ---------------------------"
sleep 1
sudo apt-get update
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Install docker and add docker user configuration ---------------------------"
sleep 1
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli 
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world