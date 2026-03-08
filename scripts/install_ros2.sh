#!/bin/bash

# ROS2 Humble Installation Script for KR260
# Based on AMD Kria Robotics AI Setup

# Make executable before running:
# chmod +x install_ros2.sh


# ------------------------------------------------------------
# 1. Set Locale
# ------------------------------------------------------------

locale

sudo apt update
sudo apt install locales -y

sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

export LANG=en_US.UTF-8

locale


# ------------------------------------------------------------
# 2. Setup Sources
# ------------------------------------------------------------

sudo apt install software-properties-common -y
sudo add-apt-repository universe

# Fix GitHub connection issue
sed -i -e 'a185.199.108.133 raw.githubusercontent.com' /etc/hosts

sudo apt update
sudo apt install curl -y

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
-o /usr/share/keyrings/ros-archive-keyring.gpg


# ------------------------------------------------------------
# 3. Add ROS2 Repository
# ------------------------------------------------------------

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
http://packages.ros.org/ros2/ubuntu \
$(. /etc/os-release && echo $UBUNTU_CODENAME) main" \
| sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null


# ------------------------------------------------------------
# 4. Install ROS2
# ------------------------------------------------------------

sudo apt update
sudo apt upgrade -y

sudo apt install ros-humble-desktop -y
sudo apt install ros-dev-tools -y


# ------------------------------------------------------------
# 5. Environment Setup
# ------------------------------------------------------------

source /opt/ros/humble/setup.bash

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc


# ------------------------------------------------------------
# 6. Install TurtleSim
# ------------------------------------------------------------

sudo apt update
sudo apt install ros-humble-turtlesim -y


# ------------------------------------------------------------
# 7. Verify Installation
# ------------------------------------------------------------

ros2 pkg executables turtlesim