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

sudo apt-get -y install git

echo "clone uav_ros_simulation"
cd
git clone https://github.com/lmark1/uav_ros_simulation.git
cd uav_ros_simulation

./installation/install_and_setup_workspace.sh

gitman update ardupilot --skip-lock --force
gitman update

# checkout the SHA
cd ~/uav_ros_simulation/.gitman/$PACKAGE_NAME
git checkout "$SHA"

cd ~/uav_ws/src
ln -s ~/uav_ros_simulation
source /opt/ros/$ROS_DISTRO/setup.bash