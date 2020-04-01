#!/bin/bash
set -e
# setup ros environment
if [ ! -z "${ROS2_DISTRO}" ]
then
source "/opt/ros/$ROS2_DISTRO/setup.bash"
else
source "/opt/ros/$ROS1_DISTRO/setup.bash"
fi
exec "$@"
