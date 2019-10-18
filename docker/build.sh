#!/bin/bash
source option.sh
sudo ./stop.sh
echo "ros $ROS2_DISTRO will be installed in container $CONTAINER_NAME:latest"
echo "Building a docker images ---------------------------"
sleep 1
docker build --build-arg BASE_IMAGE=$BASE_IMAGE \
    --build-arg ROS2_DISTRO=$ROS2_DISTRO \
    --build-arg DOCKER_USER=$DOCKER_USER \
    --build-arg DOCKER_USER=$DOCKER_USER \
    --build-arg BUILD_AI_PACKAGE=$BUILD_AI_PACKAGE \
    --build-arg TZ=$TZ \
    -t $CONTAINER_NAME .