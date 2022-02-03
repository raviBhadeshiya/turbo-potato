#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# read default config
source $DIR/config

while getopts "t:" opt; do
  case $opt in
    t) CONTAINER_TAG=$OPTARG ;;
    *) echo -e "${RED}Args not supported${NC}" >&2
       exit 1
  esac
done

RUNTIME_CONTAINER_NAME=$CONTAINER_NAME:$CONTAINER_TAG

# stop exisiting docker
$DIR/stop.sh -t $CONTAINER_TAG

# If NVIDIA is present, enable use of gpu
if test -c /dev/nvidia0 && [ "$USE_GPU" = true ];
then
	GPU_ENABLE='--gpus all'
else
	GPU_ENABLE=
fi

XSOCK=/tmp/.X11-unix
xhost +local:root &> /dev/null

echo -e "${GREEN}Starting $RUNTIME_CONTAINER_NAME ...${NC}"
docker run -itd \
	--net=host \
	--privileged \
	--cap-add SYS_NICE \
	--pid=host \
	$GPU_ENABLE \
	-e DISPLAY=unix$DISPLAY \
	-e TERM=xterm-256color \
	-e QT_GRAPHICSSYSTEM=native \
	-e QT_X11_NO_MITSHM=1 \
	-u $(id -u):$(id -g) \
	-v $XSOCK:$XSOCK:rw \
	-v /dev:/dev:rw \
	-v /tmp:/tmp:rw \
	-v /home/$USER/.Xauthority:/home/$DOCKER_USER/.Xauthority:rw \
	-v /home/$USER:/home/$DOCKER_USER:rw \
	--name $CONTAINER_NAME \
	$RUNTIME_CONTAINER_NAME \
	bash

xhost -local:root &> /dev/null