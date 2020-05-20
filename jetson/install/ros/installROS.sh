#!/bin/bash
# Install ROS Melodic

# enable all Ubuntu packages:
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-add-repository restricted

# add ROS repository to apt sources
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# install ROS Base
sudo apt-get update
sudo apt-get install ros-melodic-ros-base

# add ROS paths to environment
sudo sh -c 'echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc'

# install rviz
sudo apt-get install ros-melodic-rviz

# install realsense camera ros package
sudo apt-get install ros-melodic-realsense2-camera

# install rplidar ros package
sudo apt-get install ros-melodic-rplidar-ros
