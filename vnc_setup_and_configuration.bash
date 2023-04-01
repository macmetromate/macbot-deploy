#! /bin/sh


sudo apt install lxde
sudo apt install tigervnc-standalone-server tigervnc-xorg-extension

# Sometimes it fails to create this file, this is needed to use lxde within vnc
touch ~/.vnc/xstartup
echo "unset SESSION_MANAGER" > ~/.vnc/xstartup
echo "unset DBUS_SESSION_BUS_ADDRESS" >> ~/.vnc/xstartup
echo "startlxde &" >> ~/.vnc/xstartup



echo "PLEASE SET YOUR VNC ACCESS CREDENTIALS"
# Will prompt for credentials
vncserver
# Quietly checking and launching the vnc server upon ssh connection
echo "vncserver :2 -depth 24 -geometry 1920x1080 > /dev/null" >> ~/.bashrc

sudo wget --output-document=/usr/share/backgrounds/MacBotWallpaper.png https://github.com/septmacbot/macbot/raw/main/docs/Labs/Wallpapers/MARCWallpaper.png
sudo reboot
# Must swap out wallpaper manually because vnc and desktop modes use different desktop environments
