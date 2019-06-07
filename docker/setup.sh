#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

while true; do
read -p "Do you wish to set custom docker command? " yn
case $yn in
    [Yy]* ) echo -e "alias rosStart=$DIR/start.sh
alias rosStop=$DIR/stop.sh
alias rosBash=$DIR/bash.sh" >> ~/.bash_aliases && \
echo "Command added:
Type rosStart to start ros 2 docker container
Type rosBash to bash into ros 2 docker container
Type rosStop to stop ros 2 docker container

To remove/modify this goto ~/.bash_aliases"; break;; 
    [Nn]* ) echo "skiping alias"; sleep 1; break;;
    * ) echo "Please answer yes or no."
esac
done

bash