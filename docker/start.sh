#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/option.sh
$DIR/stop.sh

# If NVIDIA is present, enable use of gpu
if test -c /dev/nvidia0;
then
	GPU_ENABLE='--gpus all'
else
	GPU_ENABLE=
fi

XSOCK=/tmp/.X11-unix
xhost +local: &> /dev/null

echo "Starting $CONTAINER_NAME ..."
docker run -itd \
	--net=host \
	--privileged \
	$GPU_ENABLE \
	--interactive \
	-e DISPLAY \
	-e TERM=xterm-256color \
	-e QT_GRAPHICSSYSTEM=native \
	-u $(id -u):$(id -g) \
	-v $XSOCK:$XSOCK:rw \
	-v /dev:/dev:rw \
	-v /tmp:/tmp:rw \
	-v /home/$USER/.Xauthority:/home/$DOCKER_USER/.Xauthority:rw \
	-v /home/$USER:/home/$DOCKER_USER:rw \
	--name $CONTAINER_NAME \
	$RUNTIME_CONTAINER \
	bash

xhost -local: &> /dev/null