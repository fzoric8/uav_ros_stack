#!/bin/bash

apt-get update
apt-get install -y --no-install-recommends dialog apt-utils
apt-get -y install sudo gnupg2 apt-utils libterm-readline-gnu-perl lsb-release
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
DEBIAN_FRONTEND=noninteractive apt-get install keyboard-configuration

sudo apt-get -y update -qq

# the "gce-compute-image-packages" package often freezes the installation at some point
# the installation freezes when it tries to manage some systemd services
# this attempts to install the package and stop the problematic service during the process
((sleep 90 && (sudo systemctl stop google-instance-setup.service && echo "gce service stoped" || echo "gce service not stoped")) & (sudo timeout 120s apt-get -y install gce-compute-image-packages)) || echo "\e[1;31mInstallation of gce-compute-image-packages failed\e[0m"

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

sudo apt-get -y upgrade --fix-missing
sudo apt-get -y install git

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

## | --------- change to the directory of this script --------- |

cd "$MY_PATH"

## | ----------------------- install ROS ---------------------- |

bash $MY_PATH/dependencies/ros.sh

## | -------------- install general dependencies -------------- |

bash $MY_PATH/dependencies/general.sh

## | ------- add sourcing of shell additions to .bashrc ------- |

# TODO.