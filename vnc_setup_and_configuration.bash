#! /bin/sh
sudo apt install lxde
sudo apt install tigervnc-standalone-server tigervnc-xorg-extension

# Sometimes it fails to create this file
touch ~/.vnc/xstartup
echo "unset SESSION_MANAGER" > ~/.vnc/xstartup
echo "unset DBUS_SESSION_BUS_ADDRESS" >> ~/.vnc/xstartup
echo "startlxde &" >> ~/.vnc/xstartup



echo "PLEASE SET YOUR VNC ACCESS CREDENTIALS"
vncserver
mkdir -p ~/.config/autostart
touch ~/.config/autostart/autostart_vnc.bash
echo "#! /bin/sh " > ~/.config/autostart/autostart_vnc.bash
echo "vncserver :2 -depth 24 -geometry 1920x1080" >> ~/.config/autostart/autostart_vnc.bash
chmod +x ~/.config/autostart/autostart_vnc.bash
ln ~/.config/autostart/autostart_vnc.bash ~
sudo wget --output-document=/usr/share/backgrounds/MacBotWallpaper.png https://github.com/sokacza/macbot/raw/main/docs/Labs/Wallpapers/MARCWallpaper.png
sudo reboot

