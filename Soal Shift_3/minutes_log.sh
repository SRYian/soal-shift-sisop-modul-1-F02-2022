#!/bin/bash
ram="$(free -m)"
disk=$(du -sh $HOME)
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * free -m; du -sh $HOME; >> /home/$USER/metrics_$(date +\%Y\%m\%d\%H\%M\%S).log" >> mycron
#install new cron file
crontab mycron
rm mycron