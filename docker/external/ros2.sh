#!/bin/bash

locale-gen en_US en_US.UTF-8 

update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 

export LANG=en_US.UTF-8 

curl http://repo.ros2.org/repos.key | apt-key add - &> /dev/null

sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' &> /dev/null

apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-vcstool \
    python3-argcomplete \
    python-rosdep \
    ros-$ROS2_DISTRO-desktop \
    ros-$ROS2_DISTRO-rttest \
    ros-$ROS2_DISTRO-launch-testing-ament-cmake \
    ros-$ROS2_DISTRO-ros-testing \
    ros-$ROS2_DISTRO-rclcpp-action \
    ros-$ROS2_DISTRO-gazebo-dev \
    ros-$ROS2_DISTRO-gazebo-msgs \
    ros-$ROS2_DISTRO-gazebo-plugins \
    ros-$ROS2_DISTRO-gazebo-ros \
    ros-$ROS2_DISTRO-gazebo-ros-pkgs \

rm -rf /var/lib/apt/lists/*