#!/bin/bash

# 1
# Innate cron/auto run cron from this bash script
# problem: date doesnt change, so it all comes into 1 file 

# #write out current crontab
# crontab -l > mycron
# #echo new command into cron file

# echo "* * * * * usr/bin/free -m >> /home/$USER/metrics_$(date +\%Y\%m\%d\%H\%M\%S).log" >> mycron
# echo "* * * * * usr/bin/du -sh $HOME >> /home/$USER/metrics_$(date +\%Y\%m\%d\%H\%M\%S).log" >> mycron
# #install new cron file
# crontab mycron
# rm mycron

# 2
# Alternative without cron
# this uses cron externally(aka DIY :v) to run this file

dt=$(date +\%Y\%m\%d\%H\%M\%S);
free -m -t >> /home/$USER/metrics_$dt.log
du -sh $HOME >> /home/$USER/metrics_$dt.log