#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/option.sh
echo "Stopping $CONTAINER_NAME ..."
docker stop $CONTAINER_NAME &> /dev/null
echo "Removing $CONTAINER_NAME ..."
docker rm $CONTAINER_NAME &> /dev/null
