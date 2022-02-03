#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# read default config
source $DIR/config

EXTRA_CMD=''
while getopts "t:c:" opt; do
  case $opt in
    t) CONTAINER_TAG=$OPTARG ;;
    c) EXTRA_CMD=$OPTARG ;;
    *) echo -e "${RED}Args not supported${NC}" >&2
       exit 1
  esac
done

BUILD_CONTAINER_NAME=$CONTAINER_NAME:$CONTAINER_TAG

# stop exisiting docker
$DIR/stop.sh -t $CONTAINER_TAG
echo -e "${GREEN}Building a docker images $BUILD_CONTAINER_NAME ${NC}"
# echo -e "${GREEN}ROS $ROS1_DISTRO will be installed in image${NC}"
sleep 1

docker build \
    --build-arg uid=$(id -u) \
    --build-arg gid=$(id -g) \
    --build-arg TZ=$TZ \
    --build-arg DOCKER_USER=$DOCKER_USER \
    --build-arg DOCKER_PASSWD=$DOCKER_PASSWD \
    $EXTRA_CMD \
    -t $BUILD_CONTAINER_NAME .