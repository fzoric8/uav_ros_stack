#!/bin/bash

# Credits to https://github.com/ctu-mrs/uav_core

# Exit immediatelly if a command exits with a non-zero status
set -e

# Executes a command when DEBUG signal is emitted in this script - should be after every line
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

# Executes a command when ERR signal is emmitted in this script
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

# install gdb and python3-pil for gdb-imshow
sudo apt-get -y install gdb python3-pil

# link the configuration and mods
mkdir -p ~/.gdb

ln -sf $MY_PATH/gdb_modules/gdb-imshow ~/.gdb
ln -sf $MY_PATH/gdb_modules/eigen ~/.gdb
ln -sf $MY_PATH/gdb_modules/gdb-dashboard ~/.gdb
[ ! -e "~/.gdbinit" ] && cp -f $MY_PATH/dotgdbinit ~/.gdbinit

# copy the scripts for debugging roslaunched programs
sudo ln -sf $MY_PATH/debug_roslaunch /usr/bin/debug_roslaunch
sudo ln -sf $MY_PATH/debug_ros2launch /usr/bin/debug_ros2launch
