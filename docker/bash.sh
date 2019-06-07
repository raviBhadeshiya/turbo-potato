#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/option.sh
docker exec -i -t $CONTAINER_NAME bash -c "source "/opt/ros/$ROS2_DISTRO/setup.bash" && bash"
