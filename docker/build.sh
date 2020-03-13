#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/option.sh
./stop.sh
echo "ros $ROS2_DISTRO will be installed in container $CONTAINER_NAME:latest"
if [ ! -z "${ROS1_DISTRO}" ]; then echo "Install of ros $ROS1_DISTRO enabled !!"; fi
echo "Building a docker images ---------------------------"
sleep 1
docker build --build-arg BASE_IMAGE=$BASE_IMAGE \
    --build-arg ROS2_DISTRO=$ROS2_DISTRO \
    --build-arg ROS1_DISTRO=$ROS1_DISTRO \
    --build-arg DOCKER_USER=$DOCKER_USER \
    --build-arg DOCKER_PASSWD=$DOCKER_PASSWD \
    --build-arg TZ=$TZ \
    -t $CONTAINER_NAME \
    ${@:1:99} . \
