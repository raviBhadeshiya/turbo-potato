#!/bin/bash
BASE_IMAGE=nvidia/cuda:10.1-runtime-ubuntu18.04 # base image for docker

TZ=America/New_York # To moify container time zone

DOCKER_USER=anton # docker user name
DOCKER_PASSWD=$(echo $DOCKER_USER | rev) # reverse !

CONTAINER_NAME=anton  # set this to change container name
RUNTIME_CONTAINER=$CONTAINER_NAME # run custom container

ROS2_DISTRO=eloquent # ros distro installation
ROS_DISTRO=melodic # specify distro otherwise leave blank to install ros1
BUILD_ML_PACKAGE=true 

if [ "$BUILD_ML_PACKAGE" = "true" ]; 
then 
    BASE_IMAGE=nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04 # ml packager required cudnn image
fi
