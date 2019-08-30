#!/bin/bash
echo "Setting up the enviroment ---------------------------"
sleep 1
echo -e "alias rosStart='cd ~/turbo-potato/docker/ && ./start.sh'
alias rosStop='cd ~/turbo-potato/docker/ && ./stop.sh'
alias rosBash='cd ~/turbo-potato/docker/ && ./bash.sh'" >> ~/.bash_aliases
bash

echo "Command added:
Type rosStart to start docker container
Type rosBash to bash into docker container
Type rosStop to stop docker container"