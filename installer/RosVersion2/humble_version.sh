#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo -E apt update 
sudo apt update && apt -y upgrade
sudo apt install -y sudo curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt upgrade
sudo -E apt install -y ros-humble-desktop ros-dev-tools
source /opt/ros/humble/setup.bash