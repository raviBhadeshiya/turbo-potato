#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# TODO: Check if alias already present, and modify with sed other wise add new one
source $DIR/config

while true; do
echo -e "${GREEN}Do you wish to set custom docker command? ${NC}" && read -p "" yn
case $yn in
    [Yy]* ) echo -e "alias turboStart=$DIR/start.sh
alias turboStop=$DIR/stop.sh
alias turboBash=$DIR/bash.sh
alias rosSource='source /opt/ros/$ROS1_DISTRO/setup.bash'
alias wdSource='source devel/setup.sh'" >> ~/.bash_aliases && \
echo -e "${BLUE}Command added:
Type turboStart to start turbo docker container
Type turboBash to bash into turbo docker container
Type turboStop to stop turbo docker container
Type rosSource to source ros in container
Type wdSource to source devel in ros based workspace(only work inside workspace)

NOTE:
To remove/modify this check your ~/.bash_aliases${NC}"; break;;
    [Nn]* ) echo "${GREEN}skiping alias${NC}"; sleep 1; break;;
    * ) echo "Please answer yes or no."
esac
done

source ~/.bashrc