#!/bin/bash
source option.sh
docker exec -i -t $CONTAINER_NAME bash -c "source "/opt/ros/$ROS2_DISTRO/setup.bash" && bash"
