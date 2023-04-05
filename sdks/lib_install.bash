

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
unzip ~/macbot/sdks/lib_golink_env 
cd ~/macbot/sdks/lib_golink_env/extern/pybinn
sudo python3 setup.py install
cd ~/macbot/sdks/lib_golink_env/extern/python-can-isotp
sudo python3 setup.py install
echo "REMEMBER TO START THE CAN0 INTERFACE BEFORE STARTING"

#   lib_ydldiar install
unzip ~/macbot/sdks/lib_ydlidar
cd ~/macbot/sdks/lib_ydlidar
mkdir build/
cd build/
cmake ..
make
sudo make install

#   lib_realsense install
unzip ~/macbot/sdks/lib_realsense
chmod -R 0777 ~/macbot/sdks/lib_realsense
cd ~/macbot/sdks/lib_realsense
mkdir build
cd build
cmake ../ -DBUILD_EXAMPLES=true
make
sudo make install


cd ~/macbot

