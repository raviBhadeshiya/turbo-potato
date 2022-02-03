#!/bin/bash
GREEN='\e[92m'
YELLOW='\e[93m'
NC='\e[0m'

echo -e "${GREEN}Starting install script......${NC}"

while true; do
echo -e "${GREEN}Do you wish to install Drivers? including graphic card! ${NC}" && read -p "" yn
case $yn in
    [Yy]* ) sudo ./install/autoinstall-driver.sh; break;; 
    [Nn]* ) echo -e "${YELLOW}skiping Drivers installation${NC}"; sleep 1; break;;
    * ) echo -e "${GREEN}Please answer yes or no.${NC}"
esac
done

while true; do
echo -e "${GREEN}Do you wish to install docker? ${NC}" && read -p "" yn
case $yn in
    [Yy]* ) sudo ./install/docker.sh; break;; 
    [Nn]* ) echo -e "${YELLOW}skiping docker installation${NC}"; sleep 1; break;;
    * ) echo -e "${GREEN}Please answer yes or no.${NC}"
esac
done

while true; do
echo -e "${GREEN}Do you wish to install nvidia docker? ${NC}" &&  read -p "" yn
case $yn in
    [Yy]* ) sudo ./install/nvidia_docker.sh; break;; 
    [Nn]* ) echo -e "${YELLOW}skiping nvidia docker installation${NC}"; sleep 1; break;;
    * ) echo -e "${GREEN}Please answer yes or no.${NC}"
esac
done

while true; do
echo -e "${GREEN}Do you want to build image? ${NC}" &&  read -p "" yn
case $yn in
    [Yy]* ) sudo ./build.sh; break;; 
    [Nn]* ) echo -e "${YELLOW}skiping image build${NC}"; sleep 1; break;;
    * ) echo -e "${GREEN}Please answer yes or no.${NC}"
esac
done

./setup.sh