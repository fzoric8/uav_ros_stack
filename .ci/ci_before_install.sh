  sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu $ROS_CI_DESKTOP main\" > /etc/apt/sources.list.d/ros-latest.list"
  sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
  sudo apt-get update -qq
  sudo apt-get install dpkg
  sudo apt-get install -y python-catkin-pkg python-rosdep python-wstool ros-$ROS_DISTRO-ros-base
  source /opt/ros/$ROS_DISTRO/setup.bash
  
  # Prepare rosdep to install dependencies.
  sudo rosdep init
  rosdep update --include-eol-distros  # Support EOL distros.