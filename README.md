# UAV ROS Stack
Stack of ROS packages for PX4 / Ardupilot compatible Unmanned Aerial Vehicles

## Docker
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