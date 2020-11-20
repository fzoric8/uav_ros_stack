#!/bin/bash

# Exit immediatelly if a command exits with a non-zero status
set -e

# Executes a command when DEBUG signal is emitted in this script - should be after every line
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# Executes a command when ERR signal is emmitted in this script
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

apt-get update
apt-get install -y --no-install-recommends dialog apt-utils
apt-get -y install sudo gnupg2 apt-utils libterm-readline-gnu-perl lsb-release
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

sudo apt-get -y update -qq

# the "gce-compute-image-packages" package often freezes the installation at some point
# the installation freezes when it tries to manage some systemd services
# this attempts to install the package and stop the problematic service during the process
((sleep 90 && (sudo systemctl stop google-instance-setup.service && echo "gce service stoped" || echo "gce service not stoped")) & (sudo timeout 120s apt-get -y install gce-compute-image-packages)) || echo "\e[1;31mInstallation of gce-compute-image-packages failed\e[0m"

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"
[ "$distro" = "20.04" ] && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends keyboard-configuration

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

## | --------------------- install gitman --------------------- |

bash $MY_PATH/dependencies/gitman.sh

gitman install --force

## | ------- add sourcing of shell additions to .bashrc ------- |

num=`cat ~/.bashrc | grep "shell_additions.sh" | wc -l`
if [ "$num" -lt "1" ]; then

  TEMP=`( cd "$MY_PATH/../miscellaneous/shell_additions" && pwd )`

  echo "Adding source to .bashrc"
  # set bashrc
  echo "
# MRS shell configuration
source $TEMP/shell_scripts.sh" >> ~/.bashrc

fi