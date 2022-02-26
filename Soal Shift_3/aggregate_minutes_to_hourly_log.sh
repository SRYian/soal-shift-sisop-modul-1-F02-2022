#!/bin/bash
dt=$(date '+%Y%m%d%H');
# use cat to search for a file that contains the dt string and appends it to a new file called metrics_agg
cat /home/$USER/metrics_*"$dt"*.log > /home/$USER/metrics_agg_$dt.log
