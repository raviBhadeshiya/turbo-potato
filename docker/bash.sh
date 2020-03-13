#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/option.sh

CMD_ARGS=
if [ $# -ge 1 ] ; then
    CMD_ARGS="&& ${@:1:99}"
fi
EXEC_CMD="source "/opt/ros/$ROS2_DISTRO/setup.bash" $CMD_ARGS && /bin/bash"

docker exec -i -t $CONTAINER_NAME /bin/bash -c "$EXEC_CMD"