# UAV ROS Stack
Stack of ROS packages for PX4 / Ardupilot compatible Unmanned Aerial Vehicles
| uav_ros_stack build status | [![Build Status](https://travis-ci.org/lmark1/uav_ros_stack.svg?branch=main)](https://travis-ci.org/lmark1/uav_ros_stack) |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|

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

## Credits

All credits for repository structure and setup goes to Multi-robot Systems ([CTU-MRS](https://github.com/ctu-mrs)) group at the Czech Technical University in Prague.