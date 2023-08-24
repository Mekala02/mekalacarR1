#!/bin/bash

IP=$(hostname -I)
array=($IP)
IP=${array[0]}

export ROS_MASTER_URI=http://192.168.1.127:11311
export ROS_IP=${array[0]}