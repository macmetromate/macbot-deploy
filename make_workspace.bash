#!/bin/bash

rm ./install_log.txt
touch ./install_log.txt
echo "Start install" > ./install_log.txt

mkdir -p macbot_ws/src

# For melodic and general
sudo apt -y install git 
sudo apt -y install perl 
sudo apt -y install wget 
sudo apt -y install libsdl-image1.2-dev
sudo apt -y install libsdl-dev

# For ydlidar
sudo apt -y install cmake libsdl2-dev g++ 
sudo apt -y install can-isotp rospkg

# For GoLink CAN interface
sudo apt -y install python3 python3-pip python-can python-can-isotp 
sudo pip3 install -U rospkg

# Required additional ROS packages
sudo apt -y install ros-melodic-teleop-twist-keyboard 
sudo apt -y install ros-melodic-scan-tools
sudo apt install ros-melodic-turtlesim 


sudo echo "Installed packages" >> ./install_log.txt

# SDK's
git clone --branch master https://github.com/YDLIDAR/YDLidar-SDK.git ./temporary/YDLidar-SDK
sudo echo "Cloned YDLiDAR SDK" >> ./install_log.txt 
mkdir ./temporary/YDLidar-SDK/build
cd temporary/YDLidar-SDK/build
cmake ..
make
sudo make install
cd ../../..
rm -rf temporary/
echo "Successfully installed YDLiDAR SDK"


# ROS 
cd ~/macbot/ros
/bin/bash install_dependencies.bash
cd ~/macbot/macbot_ws/src
catkin_init_workspace
cd ..
catkin_make

echo "DONE!" >> ./install_log.txt





