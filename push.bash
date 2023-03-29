#! bin/bash

#rm -Rf ~/macbot/macbot_ws
#rm -Rf ~/macbot/install_log.txt
#rm -Rf ~/macbot/temporary
cd ~/macbot
git add .
commit_name = "${hostname}_${date}"
git commit -m "jnano: ${commit_name}"
git push origin main
git pull origin main
