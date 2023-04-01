#   Ensure that SSH keys are configured correctly on your system before running

git stash 
git pull origin main 
git stash pop
sudo chmod +x ~/macbot/make_workspace.bash
sh ~/macbot/make_workspace.bash