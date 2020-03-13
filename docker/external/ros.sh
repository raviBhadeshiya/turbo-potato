#!/bin/bash

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' &> /dev/null
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add - &> /dev/null

apt-get update && \
    apt-get install -y \
        ros-$ROS1_DISTRO-desktop \
        ros-$ROS2_DISTRO-ros1-bridge \
        ros-$ROS1_DISTRO-joint-state-publisher-gui \
        ros-$ROS1_DISTRO-industrial-* \
        ros-$ROS1_DISTRO-moveit-* \
        ros-$ROS1_DISTRO-octomap-ros \
        ros-$ROS1_DISTRO-perception-pcl \
        python-catkin-tools
rm -rf /var/lib/apt/lists/*