#! /usr/bin/python3

import os
workingDirectory = os.getcwd()

os.system(f"mkdir -p ~/.config/terminator")
os.system(f"cp ~/macbot/launcher/terminal_profiles/config ~/.config/terminator/")

golinkCanInterfaceInit = """
modprobe can;
modprobe can-raw;
modprobe slcan;
slcand -s5 -S2000000 /dev/ttyUSB0 can0;
sleep 1;
ifconfig can0 up;
echo " ";
ifconfig can0;
echo " ";
echo "MDR1 Bus Init Finished";
"""

ydlidarInterfaceInit = """
echo  'KERNEL=="ttyUSB*", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE:="0666", GROUP:="dialout",  SYMLINK+="ydlidar"' >/etc/udev/rules.d/ydlidar.rules;
echo  'KERNEL=="ttyACM*", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE:="0666", GROUP:="dialout",  SYMLINK+="ydlidar"' >/etc/udev/rules.d/ydlidar-V2.rules;
echo  'KERNEL=="ttyUSB*", ATTRS{idVendor}=="067b", ATTRS{idProduct}=="2303", MODE:="0666", GROUP:="dialout",  SYMLINK+="ydlidar"' >/etc/udev/rules.d/ydlidar-2303.rules;
service udev reload;
sleep 2;
service udev restart;
"""



while True:
    choice = input("""
    -----------------------------------------
                MACBOT LAUNCHER
    -----------------------------------------

     0 - Exit

     1 - Mapping Simulation

     2 - Mapping Physical (errors starting hardware devices)

     3 - Path Planning Simulation (Requires Testing)

     4 - Path Planning Physical (Requires Testing)

     A - View Documentation

     B - GitHub SSH Setup
     
     B1 - Clone Macbot from github (initial setup, all MacBot files)
     
     C - Install MacBot Project (install ROS and set the workspace)

     D - Update from GitHub



    """)

    if(choice == "0"):
        exit(0)
    if(choice == "1"):
        os.system(f"terminator -l \"MappingSim\"")
    elif(str(choice) == "2"):
        print("\n---------------------------------\nDefault Hardware Configuration \n---------------------------------")
        print("   - CAN Interface: USB0\n   - YDLiDAR Interface: USB1\n")
        input("Please disconnect and reconnect the lidar then press <enter>.")
        os.system(golinkCanInterfaceInit)
        os.system(ydlidarInterfaceInit)
        os.system("ls -l | grep USB")
        input("Press <enter> to launch application: ")
        os.system(f"terminator -l \"MappingPhys\"")
    elif(str(choice) == "3"):
        os.system(f"terminator -l \"PathPlanSim\"")
    elif(str(choice) == "4"):
        os.system(f"sudo sh ~/macbot/macbot_ws/src/macbot_ros/macbot_physical/script/golink-bus-init.sh")
        os.system(f"sudo sh ~/macbot/macbot_ws/src/ydlidar_ros/startup/initenv.sh")
        os.system(f"terminator -l \"PathPlanPhys\"")
    elif(str(choice) == "A"):
        os.system("chromium-browser --app=https://sept-macbot.gitbook.io/macbot/")
    elif(str(choice) == "B"):
        os.system(f"mkdir ~/.ssh")
        os.system(f"rm -rf ~/.ssh/*")
        os.system(f"mkdir ~/.ssh/macbot_deploy")
        os.system(f"cp ~/macbot/launcher/github_profiles/config ~/.ssh/")
        os.system(f"ssh-keygen -N '' -C '' -f ~/.ssh/macbot_deploy/macbot_deploy_rsa")
        os.system("echo ''")
        os.system(f"ls -l ~/.ssh/macbot_deploy")
        os.system("echo ''")
        os.system(f"cat ~/.ssh/macbot_deploy/macbot_deploy_rsa.pub")
        os.system("echo ''")
        os.system(f"echo 'GitHub Remote URL: git@github-macbot-deploy:septmacbot/macbot-deploy.git'")
    elif(str(choice) == "B1"):
        os.system("sudo git clone https://github.com/septmacbot/macbot-deploy.git /home/jnano/macbot")
    elif(str(choice) == "C"):
        os.system(f"sh ~/macbot/launcher/bash/install.bash")
    elif(str(choice) == "D"):
        os.system("sudo rm -Rf ~/macbot/macbot_ws")
        os.system("sudo rm -Rf ~/macbot/sdks/lib_golink_env/")
        os.system("sudo rm -Rf ~/macbot/sdks/lib_realsense/")
        os.system("sudo rm -Rf ~/macbot/sdks/lib_ydlidar/")
        os.system(f"sh ~/macbot/launcher/bash/pull_from_github.bash")
        os.system("echo 'Please run ( C - Install MacBot Project )")


