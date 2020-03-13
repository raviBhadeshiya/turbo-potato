#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# TODO: Check if alias already present, and modify with sed other wise add new one
source $DIR/option.sh

while true; do
read -p "Do you wish to set custom docker command? " yn
case $yn in
    [Yy]* ) echo -e "alias rosStart=$DIR/start.sh
alias rosStop=$DIR/stop.sh
alias rosBash=$DIR/bash.sh
alias rSource='source /opt/ros/$ROS1_DISTRO/setup.bash'
alias rdSource='source devel/setup.sh'" >> ~/.bash_aliases && \
echo "Command added:
Type rosStart to start ros 2 docker container
Type rosBash to bash into ros 2 docker container
Type rosStop to stop ros 2 docker container
Type rSource to source ros 1 in container
Type rdSource to source ros 1 based workspace

NOTE:
To remove/modify this goto ~/.bash_aliases"; break;;
    [Nn]* ) echo "skiping alias"; sleep 1; break;;
    * ) echo "Please answer yes or no."
esac
done

bash