#!/bin/bash
TZ=America/New_York # To modify container time zone

DOCKER_USER=anton # docker user name
DOCKER_PASSWD=$(echo $DOCKER_USER | rev)

CONTAINER_NAME=ros2  # set this to change container name
CONTAINER_TAG=latest

ROS2_DISTRO=eloquent # ros distro installation
ROS1_DISTRO= # if you want to install ros1, specify distro otherwise leave blank
