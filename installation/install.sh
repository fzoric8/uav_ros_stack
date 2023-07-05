#!/bin/bash

# Exit immediatelly if a command exits with a non-zero status
set -e

# Executes a command when DEBUG signal is emitted in this script - should be after every line
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# Executes a command when ERR signal is emmitted in this script
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"


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

## | -------------- install toppra ----------------|
#bash $MY_PATH/../ros_packages/topp_ros/installation/install.sh

## | -------------- install uav_ros_drivers ----------------|
bash $MY_PATH/../ros_packages/uav_ros_drivers/installation/install.sh

## | -------------- install tmux and tmuxinator ----------------|

bash $MY_PATH/dependencies/tmux/install.sh

## | -------------- install gdb-dahsboard ----------------------|

bash $MY_PATH/dependencies/gdb/install.sh

## | ------- add sourcing of shell additions to .bashrc ------- |

# Python fix
if [ "$distro" = "20.04" ]; then
  sudo ln -sf /usr/bin/python3 /usr/bin/python
fi

SNAME=$( echo "$SHELL" | grep -Eo '[^/]+/?$' )
BASHRC=~/.$(echo $SNAME)rc

num=`cat $BASHRC | grep "shell_scripts.sh" | wc -l`
if [ "$num" -lt "1" ]; then

  TEMP=`( cd "$MY_PATH/../miscellaneous/shell_additions" && pwd )`

  echo "Adding 'source $TEMP/shell_scripts.sh' to $BASHRC"
  # set bashrc
  echo "
# Shell script configuration
source $TEMP/shell_scripts.sh" >> $BASHRC

fi
