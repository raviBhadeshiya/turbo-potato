#!/bin/bash
echo "If you have nvidia container toolkit installed: we need to remove it and all existing GPU containers ---------------------------"
sleep 1
sudo docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
sudo apt-get purge -y nvidia-docker nvidia-docker2
echo "Add the package repositories  ---------------------------"
sleep 1
# Add the package repositories
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
echo "Install nvidia-docker2 and reload the Docker daemon configuration ---------------------------"
sleep 1
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
echo "Test nvidia-smi with the latest official CUDA image ---------------------------"
sleep 1
sudo docker run --gpus all nvidia/cuda:9.0-base nvidia-smi