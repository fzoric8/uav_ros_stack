# UAV ROS Stack
Stack of ROS packages for PX4 / Ardupilot compatible Unmanned Aerial Vehicles.  
It is meant to be installed on a UAV onboard computer.  
To run this package in a simulation environment please check out [uav_ros_simulation](https://github.com/lmark1/uav_ros_simulation).  

| UAV ROS Stack build status | [![Melodic](https://github.com/lmark1/uav_ros_stack/workflows/Melodic/badge.svg)](https://github.com/lmark1/uav_ros_stack/actions) | [![Noetic](https://github.com/lmark1/uav_ros_stack/workflows/Noetic/badge.svg)](https://github.com/lmark1/uav_ros_stack/actions)|
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|


| ROS Package                                                                               | 18.04  | 20.04|
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| [uav_ros_control](https://github.com/lmark1/uav_ros_control)                                       | [![Melodic](https://github.com/lmark1/uav_ros_control/workflows/Melodic/badge.svg)](https://github.com/lmark1/uav_ros_control/actions) | [![Noetic](https://github.com/lmark1/uav_ros_control/workflows/Noetic/badge.svg)](https://github.com/lmark1/uav_ros_control/actions) |
| [uav_ros_general](https://github.com/lmark1/uav_ros_general)                                             |  [![Melodic](https://github.com/lmark1/uav_ros_general/workflows/Melodic/badge.svg)](https://github.com/lmark1/uav_ros_general/actions) | [![Noetic](https://github.com/lmark1/uav_ros_general/workflows/Noetic/badge.svg)](https://github.com/lmark1/uav_ros_general/actions) |
| [uav_ros_msgs](https://github.com/lmark1/uav_ros_msgs)                   |  [![Melodic](https://github.com/lmark1/uav_ros_msgs/workflows/Melodic/badge.svg)](https://github.com/lmark1/uav_ros_msgs/actions) | [![Noetic](https://github.com/lmark1/uav_ros_msgs/workflows/Noetic/badge.svg)](https://github.com/lmark1/uav_ros_msgs/actions) |
| [uav_ros_lib](https://github.com/lmark1/uav_ros_lib)                                           |  [![Melodic](https://github.com/lmark1/uav_ros_lib/workflows/Melodic/badge.svg)](https://github.com/lmark1/uav_ros_lib/actions) | [![Noetic](https://github.com/lmark1/uav_ros_lib/workflows/Noetic/badge.svg)](https://github.com/lmark1/uav_ros_lib/actions) |
| [uav_ros_tracker](https://github.com/lmark1/uav_ros_tracker)                           |  [![Melodic](https://github.com/lmark1/uav_ros_tracker/workflows/Melodic/badge.svg)](https://github.com/lmark1/uav_ros_tracker/actions) | [![Noetic](https://github.com/lmark1/uav_ros_tracker/workflows/Noetic/badge.svg)](https://github.com/lmark1/uav_ros_tracker/actions) |
| [uav_ros_tests](https://github.com/lmark1/uav_ros_tests) |  [![Melodic](https://github.com/lmark1/uav_ros_tests/workflows/Melodic/badge.svg)](https://github.com/lmark1/uav_ros_tests/actions) | [![Noetic](https://github.com/lmark1/uav_ros_tests/workflows/Noetic/badge.svg)](https://github.com/lmark1/uav_ros_tests/actions) |
| [topp_ros](https://github.com/larics/topp_ros)                           | N/A | N/A |  

## Wiki
Check out [Copters of Latrics](https://sites.google.com/view/larics-copters-wiki/home) Wiki page.

## Installation

### Advanced

Follow these installation steps if you have a catkin workspace already set up.

``` bash
# Navigate to src folder of the catkin workspace
cd /path/to/catkin_ws/src

# Install uav_ros_stack
git clone https://github.com/lmark1/uav_ros_stack
cd uav_ros_stack
./installation/install.sh
```

## Docker
Install Docker using installation instruction found [here](https://docs.docker.com/engine/install/ubuntu/).

Run Dockerfile from the project root directory using the following commands:
```bash
# e.g. if you want to build a Bionic Dockerfile
docker build -f Dockerfile.bionic -t uav_ros_stack:bionic .

# Run the uav_ros_stack:bionic container
docker run -it --rm --network host --privileged -v /dev:/dev --name uav_ros_stack uav_ros_stack:bionic /bin/bash

# Stop the conatainer
docker stop uav_ros_stack

# Delete the container
docker rm uav_ros_stack
```

**NOTE**  
If you are getting permission errors regarding */var/run/docker.sock* run the following command:
```
sudo chmod 666 /var/run/docker.sock
```

Preinstalled images can be found [here](https://hub.docker.com/repository/docker/lmark1/uav_ros_stack).

## Credits

All credits for repository structure and setup goes to Multi-robot Systems ([CTU-MRS](https://github.com/ctu-mrs)) group at the Czech Technical University in Prague.
