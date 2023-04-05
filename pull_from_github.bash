#! /bin/bash

#   Ensure that SSH keys are configured correctly on your system before running

cd ~/macbot
git add .
git commit -m "ignored"
git stash 
git pull origin main 
git stash clear
