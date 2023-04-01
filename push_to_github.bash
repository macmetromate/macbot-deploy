#! /bin/bash

#   Ensure that SSH keys are configured correctly on your system before running

cd ~/macbot
git add .
commit_name = "${hostname}_${date}"
git commit -m "jnano: ${commit_name}"
git push origin main
git pull origin main
