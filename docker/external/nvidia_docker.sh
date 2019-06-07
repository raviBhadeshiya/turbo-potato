#!/bin/bash
echo "If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers ---------------------------"
sleep 1
sudo docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
sudo apt-get purge -y nvidia-docker
echo "Add the package repositories  ---------------------------"
sleep 1
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
echo "Install nvidia-docker2 and reload the Docker daemon configuration ---------------------------"
sleep 1
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd
echo "Test nvidia-smi with the latest official CUDA image ---------------------------"
sleep 1
sudo docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi