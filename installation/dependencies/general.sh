#!/bin/bash

# Exit immediatelly if a command exits with a non-zero status
set -e

# Executes a command when DEBUG signal is emitted in this script - should be after every line
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# Executes a command when ERR signal is emmitted in this script
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "$0: installing general dependencies"

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

DEBIAN_FRONTEND=noninteractive
sudo apt-get -y install cmake build-essential autotools-dev automake autoconf

# utilities
sudo apt -y install wget zip silversearcher-ag

# ros-related
sudo apt-get -y install \
  ros-$ROS_DISTRO-visualization-msgs\
  ros-$ROS_DISTRO-smach-*\
  ros-$ROS_DISTRO-diagnostic-updater\
  ros-$ROS_DISTRO-nav-msgs\
  ros-$ROS_DISTRO-angles\
  ros-$ROS_DISTRO-rosconsole-bridge\
  ros-$ROS_DISTRO-gazebo-*\
  ros-$ROS_DISTRO-eigen-conversions\
  ros-$ROS_DISTRO-tf-conversions\
  ros-$ROS_DISTRO-roslint\
  ros-$ROS_DISTRO-xacro\
  ros-$ROS_DISTRO-camera-info-manager\
  ros-$ROS_DISTRO-control-toolbox\
  ros-$ROS_DISTRO-image-view\
  ros-$ROS_DISTRO-image-transport\
  ros-$ROS_DISTRO-image-transport-plugins\
  ros-$ROS_DISTRO-image-geometry\
  ros-$ROS_DISTRO-compressed-image-transport\
  ros-$ROS_DISTRO-theora-image-transport\
  ros-$ROS_DISTRO-rosbash\
  ros-$ROS_DISTRO-rqt*\
  ros-$ROS_DISTRO-tf2-sensor-msgs\
  ros-$ROS_DISTRO-tf2-geometry-msgs\
  ros-$ROS_DISTRO-tf2-eigen\
  ros-$ROS_DISTRO-octomap-msgs\
  ros-$ROS_DISTRO-rosdoc-lite\
  ros-$ROS_DISTRO-geographic-msgs\
  ros-$ROS_DISTRO-rviz-visual-tools\
  ros-$ROS_DISTRO-catch-ros\
  ros-$ROS_DISTRO-octomap\
  ros-$ROS_DISTRO-cmake-modules\
  ros-$ROS_DISTRO-mavros\
  ros-$ROS_DISTRO-mavlink\
  ros-$ROS_DISTRO-libmavconn\
  ros-$ROS_DISTRO-mavros-extras\
  ros-$ROS_DISTRO-robot-state-publisher\
  ros-$ROS_DISTRO-joint-state-controller\
  ros-$ROS_DISTRO-effort-controllers\
  ros-$ROS_DISTRO-position-controllers

if [ "$distro" = "18.04" ]; then

sudo apt-get -y install \
  ros-melodic-multimaster-*\
  ros-melodic-flexbe-behavior-engine\
  ros-melodic-joy\
  ros-melodic-hector-gazebo-plugins\
  ros-melodic-teraranger\
  ros-melodic-sophus\
  ros-melodic-plotjuggler\

elif [ "$distro" = "20.04" ]; then

sudo apt-get -y install \
  ros-noetic-catkin \

fi

# python stuff

if [ "$distro" = "18.04" ]; then

sudo apt-get -y install \
  python-setuptools\
  python3-setuptools\
  python-prettytable\
  python-argparse\
  git-core\
  python-empy\
  python-serial\
  python-bloom\
  python-catkin-tools\
  python-pip\
  python3-pip\
  python-future\
  python3-future\
  python-crcmod\

elif [ "$distro" = "20.04" ]; then

sudo apt-get -y install \
  python3-setuptools\
  python3-prettytable\
  python3-empy\
  python3-serial\
  python3-bloom\
  python3-osrf-pycommon\
  python3-catkin-tools\
  python3-pip\
  python3-future\
  python3-crcmod\

  # python3-argparse\ # TODO find the alternative

fi

# other

sudo apt -y install \
  genromfs\
  ant\
  protobuf-compiler\
  libeigen3-dev\
  libopencv-dev\
  openocd\
  flex\
  bison\
  libncurses5-dev\
  libftdi-dev\
  libtool\
  zlib1g-dev\
  gcc-arm-none-eabi\
  libevent-dev\
  expect-dev\
  moreutils\
  xvfb\
  libsuitesparse-dev\
  libnlopt-dev\
  distcc\
  ocl-icd-opencl-dev\
  ocl-icd-dev\
  ocl-icd-libopencl1\
  clinfo\
  opencl-headers\
  libgeographic-dev\
  geographiclib-tools\
  libx264-dev\
  libzstd-dev\
  libqcustomplot-dev\
  xutils-dev\
  net-tools\

if [ "$distro" = "18.04" ]; then

sudo apt -y install \
  libqt4-dev\

elif [ "$distro" = "20.04" ]; then

sudo apt -y install \
  # libqt5-dev\ # TODO find the alternative

fi

if [ "$distro" = "18.04" ]; then
  #  Toppra dependencies
  python -m pip install --user --upgrade pip
  pip install wheel 
  pip install --upgrade pip
  pip install pytest pytest_cov

elif [ "$distro" = "20.04" ]; then
  sudo apt -y install python3-pip
  pip3 install wheel
  pip3 install --upgrade pip
  pip3 install pytest pytest_cov
fi

# Install geographic_lib_dataset.sh
curl https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh | sudo bash
