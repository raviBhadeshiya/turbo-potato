#!/bin/bash
echo "If you have nvidia container toolkit installed: we need to remove it and all existing GPU containers ---------------------------"
sleep 1
sudo docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
sudo apt-get purge -y nvidia-docker nvidia-docker2

echo "Add the package repositories  ---------------------------"
sleep 1
# Add the package repositories
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

echo "Install nvidia-docker and reload the Docker daemon configuration ---------------------------"
sleep 1
sudo apt-get update && sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker

echo "Test nvidia-smi with the latest official CUDA image ---------------------------"
sleep 1
sudo docker run --rm --gpus all nvidia/cuda:11.5.1-cudnn8-runtime-ubuntu20.04 nvidia-smi