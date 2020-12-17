#!/bin/bash
  
./installation/install.sh
./installation/workspace_setup.sh

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

cd ~/uav_ws/src
ln -s ~/uav_ros_stack
source /opt/ros/$ROS_DISTRO/setup.bash