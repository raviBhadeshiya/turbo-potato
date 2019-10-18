#!/bin/bash 
source option.sh
echo "Stopping $CONTAINER_NAME ..."
docker stop $CONTAINER_NAME &> /dev/null
sleep 1
echo "Removing $CONTAINER_NAME ..."
docker rm $CONTAINER_NAME &> /dev/null
sleep 1
echo "Starting $CONTAINER_NAME ..."
XSOCK=/tmp/.X11-unix
xhost +local:
export DISPLAY=:0
docker run -itd \
	--net=host \
	--privileged \
	--runtime=nvidia \
	--interactive \
	-e DISPLAY=$DISPLAY \
	-e QT_GRAPHICSSYSTEM=native \
	-u $(id -u):$(id -g) \
	-v $XSOCK:$XSOCK:rw \
	-v /dev:/dev:rw \
	-v /tmp:/tmp:rw \
	-v $HOME/.Xauthority:/root/.Xauthority:rw \
	-v /home/$USER:/home/$DOCKER_USER:rw \
	--name $CONTAINER_NAME \
	$RUNTIME_CONTAINER \
	bash