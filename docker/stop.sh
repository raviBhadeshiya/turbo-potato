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

RUNTIME_CONTAINER_NAME=$CONTAINER_NAME

# stop exisiting docker
echo -e "${YELLOW}Stopping $RUNTIME_CONTAINER_NAME ...${NC}"
docker stop $RUNTIME_CONTAINER_NAME &> /dev/null
echo -e "${YELLOW}Removing $RUNTIME_CONTAINER_NAME ...${NC}"
docker rm $RUNTIME_CONTAINER_NAME &> /dev/null