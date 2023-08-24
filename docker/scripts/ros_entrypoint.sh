#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash" --

IP=$(hostname -I)
array=($IP)
IP=${array[0]}

export ROS_MASTER_URI=http://$IP:11311
export ROS_IP=${array[0]}

exec "$@"