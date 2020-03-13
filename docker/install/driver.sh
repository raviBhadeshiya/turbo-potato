#!/bin/bash
echo "Setting up the drivers ---------------------------"
sudo apt-get update 
sudo apt-get upgrade -y
sleep 1
ubuntu-drivers devices
sleep 1
sudo ubuntu-drivers autoinstall
