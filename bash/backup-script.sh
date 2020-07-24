
outdatedBackup=$(ls -a | grep -i *$(date -d "$D" '+%m')*) && rm -rf $outdatedBackup

notify-send "Git upload new File Backups"
