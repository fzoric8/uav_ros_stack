#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

## | --------- change to the directory of this script --------- |

cd "$MY_PATH"

## | ----------------------- install ROS ---------------------- |

bash $MY_PATH/dependencies/ros.sh

## | -------------- install general dependencies -------------- |

bash $MY_PATH/dependencies/general.sh

## | ------- add sourcing of shell additions to .bashrc ------- |

# TODO.