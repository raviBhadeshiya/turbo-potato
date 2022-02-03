#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config

while getopts "t:e:" opt; do
  case $opt in
    t) CONTAINER_TAG=$OPTARG ;;
    e) EXTRA_CMD="&& $OPTARG" ;;
    *) echo -e "${RED}Args not supported${NC}" >&2
       exit 1
  esac
done

RUNTIME_CONTAINER_NAME=$CONTAINER_NAME
EXEC_CMD='$EXTRA_CMD && /bin/bash'

xhost +local:root &> /dev/null

docker exec -it --privileged $RUNTIME_CONTAINER_NAME /bin/bash -c "$EXEC_CMD"

xhost -local:root &> /dev/null