#!/bin/bash
  
./installation/install.sh
./installation/workspace_setup.sh

cd ~/uav_ws
ln -s $TRAVIS_BUILD_DIR
source /opt/ros/$ROS_DISTRO/setup.bash