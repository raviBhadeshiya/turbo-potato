#!/bin/bash 
source option.sh
echo "Stopping $CONTAINER_NAME ..."
docker stop $CONTAINER_NAME &> /dev/null
sleep 1
echo "Removing $CONTAINER_NAME ..."
docker rm $CONTAINER_NAME &> /dev/null
sleep 1