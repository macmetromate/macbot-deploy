#! /usr/bin/python3

import os
workingDirectory = os.getcwd()

os.system(f"mkdir -p ~/.config/terminator")
os.system(f"cp ~/macbot/launcher/terminal_profiles/config ~/.config/terminator/")

while True:
    choice = input("""
    -----------------------------------------
                MACBOT LAUNCHER
    -----------------------------------------

     0 - Exit

     1 - Mapping Simulation

     2 - Mapping Physical

     3 - Path Planning Simulation

     4 - Path Planning Physical

     A - View Documentation

     B - GitHub SSH Setup
     
     C - Install MacBot Project



    """)

    if(choice == "0"):
        exit(0)
    if(choice == "1"):
        os.system(f"terminator -l \"MappingSim\"")
    elif(str(choice) == "2"):
        os.system(f"sudo sh ~/macbot/macbot_ws/src/macbot_ros/macbot_physical/script/golink-bus-init.sh")
        os.system(f"sudo sh ~/macbot/macbot_ws/src/ydlidar_ros/startup/initenv.sh")
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
    elif(str(choice) == "C"):
        os.system(f"sh ~/macbot/install.bash")



    