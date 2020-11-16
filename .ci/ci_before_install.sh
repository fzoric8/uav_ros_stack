#!/bin/bash
  
apt-get update
apt-get install -y --no-install-recommends dialog apt-utils
apt-get -y install sudo gnupg2 apt-utils libterm-readline-gnu-perl lsb-release
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
sudo apt-get -y update -qq

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

sudo apt-get -y upgrade --fix-missing
sudo apt-get -y install git