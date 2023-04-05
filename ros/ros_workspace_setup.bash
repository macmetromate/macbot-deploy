#! /bin/bash

cd ~/macbot/ros

unzip -q ~/macbot/ros/diff_drive.zip -d ~/macbot/macbot_ws/src/
mv ~/macbot/macbot_ws/src/diff_drive-master ~/macbot/macbot_ws/src/diff_drive 

unzip -q ~/macbot/ros/navigation.zip -d ~/macbot/macbot_ws/src
mv ~/macbot/macbot_ws/src/navigation-melodic-devel ~/macbot/macbot_ws/src/navigation

unzip -q ~/macbot/ros/navigation_msgs.zip -d ~/macbot/macbot_ws/src 
mv ~/macbot/macbot_ws/src/navigation_msgs ~/macbot/macbot_ws/src/navigation_msgs

unzip -q ~/macbot/ros/ydlidar_ros_driver.zip -d ~/macbot/macbot_ws/src
mv ~/macbot/macbot_ws/src/ydlidar_ros_driver-master ~/macbot/macbot_ws/src/ydlidar_ros

unzip -q ~/macbot/ros/realsense_ros_driver.zip -d ~/macbot/macbot_ws/src
mv ~/macbot/macbot_ws/src/realsense_ros_driver-master ~/macbot/macbot_ws/src/realsense_ros

sudo apt -y install ros-melodic-ddynamic-reconfigure
sudo ln -s /usr/include/opencv4/opencv2/ /usr/include/opencv

#unzip -q geometry2.zip -d ../macbot_ws/src
#mv ../macbot_ws/src/geometry2 ../macbot_ws/src/geometry2

unzip -q ~/macbot/ros/macbot.zip -d ~/macbot/macbot_ws/src
mv ~/macbot/macbot_ws/src/macbot-master ~/macbot/macbot_ws/src/macbot_ros


cd ~/macbot/