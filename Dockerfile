FROM ubuntu:bionic


# Copy environment from travis
ENV ROS_CI_DESKTOP="`lsb_release -cs`"
ENV CI_SOURCE_PATH=$(pwd)
ENV ROSINSTALL_FILE=$CI_SOURCE_PATH/dependencies.rosinstall
ENV CATKIN_OPTIONS=$CI_SOURCE_PATH/catkin.options
ENV ROS_PARALLEL_JOBS='-j8 -l6'   
ENV PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/dist-packages:/usr/local/lib/python2.7/dist-packages
ENV ROS_DISTRO="melodic"

COPY .ci/ci_before_install.sh travis/
RUN ./travis/ci_before_install.sh

# To stall
CMD tail -f /dev/null