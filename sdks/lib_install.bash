

sudo apt -y update && sudo apt -y upgrade
cd ~/macbot/sdks

#   lib_golink_env dependencies
sudo apt -y install python3 python3-pip python-can 
sudo python3 -m pip install rospkg

#   lib_ydldiar dependencies
sudo apt -y install cmake pkg-config swig python3 python3-pip cmake libsdl2-dev g++ 

#   lib_realsense dependencies
sudo python3 -m pip install opencv-python
sudo ln -s /usr/include/opencv4/opencv2/ /usr/include/opencv
sudo ln -s /usr/include/opencv4/opencv2/ /usr/include/opencv2

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
sudo apt -y install librealsense2-dkms librealsense2-utils librealsense2-dev librealsense2-dbg 
sudo apt -y install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev at

sudo apt -y update && sudo apt -y upgrade



#   lib_golink_env install
unzip -q ~/macbot/sdks/lib_golink_env.zip -d ~/macbot/sdks
sudo python3 ~/macbot/sdks/lib_golink_env/extern/pybinn/setup.py install
sudo python3 ~/macbot/sdks/lib_golink_env/extern/python-can-isotp/setup.py install 
echo "REMEMBER TO START THE CAN0 INTERFACE BEFORE STARTING"

#   lib_ydldiar install
unzip -q ~/macbot/sdks/lib_ydlidar.zip -d ~/macbot/sdks
mkdir ~/macbot/sdks/lib_ydlidar/build/
cd ~/macbot/sdks/lib_ydlidar/build/
cmake ..
make
sudo make install

#   lib_realsense install
unzip -q ~/macbot/sdks/lib_realsense.zip -d ~/macbot/sdks
sudo chmod -R 0777 ~/macbot/sdks/lib_realsense/
sudo mkdir ~/macbot/sdks/lib_realsense/build
cd ~/macbot/sdks/lib_realsense/build
#sudo cmake ..
#sudo make
#sudo make install


cd ~/macbot

