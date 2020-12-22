# Development Guidelines

## VSCode

### Extensions

Heavily suggested extensions are:

* xaver.clang-format
* notskm.clang-tidy
* cheshirekow.cmake-format

Install the following programs outside VSCode:
```
sudo apt install clang-tidy clang-format
```

### Setup

To ensure a smoother development experience while using Gitman and symlinked folders do the following steps:

1. After launch VSCode click ```File->Open folder``` and select the *src* folder in the catkin workspace.

2. In [gitman.yml](gitman.yml) change the following

```yaml
location: ../uav_ros_stack_modules
```
3. While in *uav_ros_stack* folder type in the following commands:

``` bash
# Do not want to build symlinked gitman files
touch CATKIN_IGNORE

# Link .cmake-format.yaml to the root of your VSCode workspace
ln -s $HOME/catkin_ws/src/uav_ros_stack/.cmake-format.yaml $HOME/catkin_ws/src/.cmake-format.yaml

# Link .clang-format.yaml to the root of your VSCode workspace 
ln -s $HOME/catkin_ws/src/uav_ros_stack/.clang-format $HOME/catkin_ws/src/.clang-format

# Copy .vscode folder contents
cp -r $HOME/catkin_ws/src/uav_ros_stack/miscellaneous/dotvscode $HOME/catkin_ws/src/.vscode
```

4. Edit include paths in [c_cpp_properties.json](miscellaneous/dotvscode/c_cpp_properties.json) and [settings.json](miscellaneous/dotvscode/settings.json).