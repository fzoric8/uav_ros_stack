#!/bin/bash

set -e

echo "Starting test build"
cd ~/uav_ws
source /opt/ros/$ROS_DISTRO/setup.bash
catkin build
echo "Ended test build"