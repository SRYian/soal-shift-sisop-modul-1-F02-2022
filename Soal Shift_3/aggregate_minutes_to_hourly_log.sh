#!/bin/bash
dt=$(date '+%Y%m%d%H');
cat /home/$USER/metrics_*"$dt"*.log > /home/$USER/metrics_agg_$dt.log
