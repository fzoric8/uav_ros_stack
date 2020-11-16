  #!/bin/bash
  
  apt-get update
  apt-get install -y --no-install-recommends dialog apt-utils
  apt-get -y install sudo gnupg2 apt-utils libterm-readline-gnu-perl lsb-release
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
  sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu $ROS_CI_DESKTOP main\" > /etc/apt/sources.list.d/ros-latest.list"
  sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
  sudo apt-get update
  sudo apt-get install -y dpkg
  sudo apt-get install -y python-catkin-pkg python-rosdep python-wstool ros-$ROS_DISTRO-ros-base