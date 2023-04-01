#! /bin/bash

unzip -q diff_drive.zip -d ../macbot_ws/src/
mv ../macbot_ws/src/diff_drive-master ../macbot_ws/src/diff_drive 
unzip -q navigation.zip -d ../macbot_ws/src
mv ../macbot_ws/src/navigation-melodic-devel ../macbot_ws/src/navigation
unzip -q navigation_msgs.zip -d ../macbot_ws/src 
mv ../macbot_ws/src/navigation_msgs ../macbot_ws/src/navigation_msgs
unzip -q ydlidar_ros_driver.zip -d ../macbot_ws/src
mv ../macbot_ws/src/ydlidar_ros_driver-master ../macbot_ws/src/ydlidar_ros
#unzip -q geometry2.zip -d ../macbot_ws/src
#mv ../macbot_ws/src/geometry2 ../macbot_ws/src/geometry2
unzip -q macbot.zip -d ../macbot_ws/src
mv ../macbot_ws/src/macbot-master ../macbot_ws/src/macbot_ros