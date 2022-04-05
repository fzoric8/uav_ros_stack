#!/bin/bash

set -e

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

echo "Starting install"

# get the current commit SHA
SHA=`git rev-parse HEAD`

# get the current package name
PACKAGE_NAME=${PWD##*/}
COMMIT_ID="$GITHUB_SHA"

sudo apt-get update
sudo apt-get -y install git

echo "clone uav_ros_simulation"
cd
git clone https://github.com/larics/uav_ros_simulation.git
cd uav_ros_simulation

# install Gitman and lock the package to the current CI commit
./installation/dependencies/gitman.sh
gitman install --force
echo "Lock $PACKAGE_NAME at commit $COMMIT_ID"
cd ros_packages/$PACKAGE_NAME
git fetch --all
git checkout $COMMIT_ID
cd ../../
gitman lock $PACKAGE_NAME

./installation/install_and_setup_workspace.sh $CATKIN_WORKSPACE

# No need to link up uav_ros_simulation
source /opt/ros/$ROS_DISTRO/setup.bash
