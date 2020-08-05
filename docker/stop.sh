#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/option.sh
RUNTIME_CONTAINER=$CONTAINER_NAME # if you want to run custom container

echo "Stopping $RUNTIME_CONTAINER ..."
docker stop $RUNTIME_CONTAINER &> /dev/null
echo "Removing $RUNTIME_CONTAINER ..."
docker rm $RUNTIME_CONTAINER &> /dev/null
