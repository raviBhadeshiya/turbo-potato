#!/bin/bash
BASE_IMAGE=nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04 # base image for docker
TZ=America/New_York # To modify container time zone

DOCKER_USER=anton # docker user name
DOCKER_PASSWD=$(echo $DOCKER_USER | rev)

CONTAINER_NAME=ros2  # set this to change container name
RUNTIME_CONTAINER=$CONTAINER_NAME # if you want to run custom container

ROS2_DISTRO=eloquent # ros distro installation
ROS1_DISTRO=melodic # if you want to install ros1, specify distro otherwise leave blank
