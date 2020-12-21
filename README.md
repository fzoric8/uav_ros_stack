# UAV ROS Stack
Stack of ROS packages for PX4 / Ardupilot compatible Unmanned Aerial Vehicles
| UAV ROS Stack build status | [![Melodic](https://github.com/lmark1/uav_ros_stack/workflows/Melodic/badge.svg)](https://github.com/lmark1/uav_ros_stack/actions) | [![Noetic](https://github.com/lmark1/uav_ros_stack/workflows/Noetic/badge.svg)](https://github.com/lmark1/uav_ros_stack/actions)|
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|


| ROS Package                                                                               | 18.04  | 20.04|
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| [uav_ros_control](https://github.com/lmark1/uav_ros_control)                                       | ![Melodic](https://github.com/lmark1/uav_ros_control/workflows/Melodic/badge.svg) | ![Noetic](https://github.com/lmark1/uav_ros_control/workflows/Noetic/badge.svg) |
| [uav_ros_general](https://github.com/lmark1/uav_ros_general)                                             | CI Badge - Melodic | CI Badge - Noetic |
| [uav_ros_msgs](https://github.com/lmark1/uav_ros_msgs)                   | CI Badge - Melodic | CI Badge - Noetic |
| [uav_ros_lib](https://github.com/lmark1/uav_ros_lib)                                           | CI Badge - Melodic | CI Badge - Noetic |
| [uav_ros_tracker](https://github.com/lmark1/uav_ros_tracker)                           | CI Badge  - Melodic | CI Badge - Noetic |
## Docker
Install Docker using installation instruction found [here](https://docs.docker.com/engine/install/ubuntu/).

Run Dockerfile from the project root directory using the following commands:
```bash
# Build the Dockerfile
docker build . -t uav_ros_stack

# Run the Dockerfile
docker run --name uav_ros_stack uav_ros_stack:latest

# Execute /bin/bash command on the running container
docker exec -it uav_ros_stack /bin/bash

# Stop the conatainer
docker stop uav_ros_stack

# Delete the container
docker rm uav_ros_stack
```

Preinstalled images can be found [here](https://hub.docker.com/repository/docker/lmark1/uav_ros_stack).

## Credits

All credits for repository structure and setup goes to Multi-robot Systems ([CTU-MRS](https://github.com/ctu-mrs)) group at the Czech Technical University in Prague.
