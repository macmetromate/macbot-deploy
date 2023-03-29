rm -rf catkin_ws/
rm -rf temporary/
git stash && git pull && git stash pop
sudo chmod +x make_workspace
./make_workspace