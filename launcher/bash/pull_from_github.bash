#! /bin/bash

#   Ensure that SSH keys are configured correctly on your system before running
# Need to create .git config
# name=$(hostname)
#email="septmacbot@gmail.com"

#GITCONFIG_FILE="$HOME/.gitconfig"

# Create or overwrite .gitconfig
#echo "[user]" > "$GITCONFIG_FILE"
#echo "    name = $COMPUTER_NAME" >> "$GITCONFIG_FILE"
#echo "    email = $EMAIL" >> "$GITCONFIG_FILE"
# Display success message
echo "Git configuration set successfully."

# this is for pulling
cd ~/macbot
git add .
git commit -m "ignored"
git stash 
git pull origin main 
git stash clear
