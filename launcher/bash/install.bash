#!/bin/bash

touch ~/macbot/install_log.txt
echo "Start install" > ~/macbot/install_log.txt

sudo mkdir -p ~/macbot/macbot_ws/src

# For melodic and general
sudo apt -y install git 
sudo apt -y install perl 
sudo apt -y install wget 
sudo apt -y install libsdl-image1.2-dev
sudo apt -y install libsdl-dev
sudo apt -y install ros-melodic-tf2-sensor-msgs

# Additional ROS packages
sudo apt -y install ros-melodic-teleop-twist-keyboard 
sudo apt -y install ros-melodic-scan-tools
sudo apt install ros-melodic-turtlesim 
sudo apt -y install ros-melodic-gmapping

sudo echo "Installed packages" >> ~/macbot/install_log.txt

# SDK's
chmod +x ~/macbot/sdks/lib_install.bash
sudo sh ~/macbot/sdks/lib_install.bash

# ROS 
#    Dry run
cd ~/macbot/macbot_ws/src
sudo /bin/bash -c 'source /opt/ros/melodic/setup.bash; catkin_init_workspace'

cd ..
sudo /bin/bash -c 'source /opt/ros/melodic/setup.bash; catkin_make'

echo "First build" >> ~/macbot/install_log.txt
sudo echo "source ~/macbot/macbot_ws/devel/setup.bash" >> ~/.bashrc
#    Add packages
chmod +x ~/macbot/ros/ros_workspace_setup.bash
sudo sh ~/macbot/ros/ros_workspace_setup.bash


#    Full run
echo "Second build" >> ~/macbot/install_log.txt
cd ~/macbot/macbot_ws
sudo /bin/bash -c 'source /opt/ros/melodic/setup.bash; catkin_make'

echo "DONE!" >> ~/macbot/install_log.txt

sudo rosdep fix-permissions
rosdep update

ln ~/macbot/launcher/launcher.py ~/Desktop
ln ~/macbot/launcher/launcher.py ~/macbot
sudo apt -y install terminator

