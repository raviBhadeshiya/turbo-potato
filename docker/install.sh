#!/bin/bash

while true; do
read -p "Do you wish to install Docker?" yn
case $yn in
    [Yy]* ) sudo ./external/docker.sh; break;; 
    [Nn]* ) echo "skiping docker installation"; sleep 1; break;;
    * ) echo "Please answer yes or no."
esac
done

while true; do
read -p "Do you wish to install nvidia docker 2?" yn
case $yn in
    [Yy]* ) sudo ./external/nvidia_docker.sh; break;; 
    [Nn]* ) echo "skiping nvidia docker 2 installation"; sleep 1; break;;
    * ) echo "Please answer yes or no."
esac
done

while true; do
read -p "Do you want to build image?" yn
case $yn in
    [Yy]* ) sudo ./build.sh; break;; 
    [Nn]* ) echo "skiping image build"; sleep 1; break;;
    * ) echo "Please answer yes or no."
esac
done

while true; do
read -p "Do you want to setup enviroment?" yn
case $yn in
    [Yy]* ) sudo ./external/setup.sh; break;; 
    [Nn]* ) echo "skiping setup"; sleep 1; break;;
    * ) echo "Please answer yes or no."
esac
done
