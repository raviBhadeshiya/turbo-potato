#!/bin/bash

locale-gen en_US en_US.UTF-8
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

apt update && sudo apt install curl gnupg2 lsb-release

curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

apt update && apt install -y \
    python3-colcon-common-extensions \
    python3-vcstool \
    python3-argcomplete \
    python-rosdep \
    ros-$ROS2_DISTRO-desktop \
    ros-$ROS2_DISTRO-rttest \
    ros-$ROS2_DISTRO-launch-testing-ament-cmake \
    ros-$ROS2_DISTRO-ros-testing \
    ros-$ROS2_DISTRO-rclcpp-action 

rm -rf /var/lib/apt/lists/*