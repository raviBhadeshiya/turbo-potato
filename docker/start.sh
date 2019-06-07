#!/bin/bash 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/option.sh
echo -ne "Stopping $CONTAINER_NAME ..."
docker stop $CONTAINER_NAME &> /dev/null

echo -ne "\rRemoving $CONTAINER_NAME ..."
docker rm $CONTAINER_NAME &> /dev/null

echo -ne "\rStarting $CONTAINER_NAME ...\n"

XSOCK=/tmp/.X11-unix
xhost +local: &> /dev/null

docker run -itd \
	--net=host \
	--privileged \
	--gpus all \
	--interactive \
	-e DISPLAY \
	-e QT_GRAPHICSSYSTEM=native \
	-e TERM=xterm-256color \
	-u $(id -u):$(id -g) \
	-v $XSOCK:$XSOCK:rw \
	-v /dev:/dev:rw \
	-v /tmp:/tmp:rw \
	-v $HOME/.Xauthority:/root/.Xauthority:rw \
	-v /home/$USER:/home/$DOCKER_USER:rw \
	--name $CONTAINER_NAME \
	$RUNTIME_CONTAINER \
	bash

xhost -local: &> /dev/null