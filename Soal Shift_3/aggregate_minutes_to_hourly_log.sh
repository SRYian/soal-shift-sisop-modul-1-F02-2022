#!/bin/bash

# Get the current date to search
dt=$(date '+%Y%m%d%H');
# use cat to search for a file that contains the dt string and appends it to a new file called metrics_agg
cat /home/$USER/metrics_*"$dt"*.log > /home/$USER/metrics_agg_$dt.log

# example command for the separation
# from argument 2 onwards it is the numbers itself
# awk  '/^Mem/ {print $1" "$2" "$3" "$4" "$5" "$6" "$7}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1

# Main goal :
# We separate each arguments using AWK, Sort it, and print the tail/head that we want

# we use tail because the max is at the bottom
echo MAX
awk  '/^Mem/ {print $2}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1
awk  '/^Mem/ {print $3}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1
awk  '/^Mem/ {print $4}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1
awk  '/^Mem/ {print $5}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1
awk  '/^Mem/ {print $6}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1
awk  '/^Mem/ {print $7}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1
awk  '/^Swap/ {print $2}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1
awk  '/^Swap/ {print $3}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1
awk  '/^Swap/ {print $4}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1
awk  '/home/ {print $1}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | tail -1


# we use head because the smallest is on the top
echo MIN
awk  '/^Mem/ {print $2}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1
awk  '/^Mem/ {print $3}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1
awk  '/^Mem/ {print $4}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1
awk  '/^Mem/ {print $5}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1
awk  '/^Mem/ {print $6}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1
awk  '/^Mem/ {print $7}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1
awk  '/^Swap/ {print $2}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1
awk  '/^Swap/ {print $3}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1
awk  '/^Swap/ {print $4}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1
awk  '/home/ {print $1}' /home/$USER/metrics_agg_$dt.log | sort -nk2,2 | head -1

# We separate each arguments using AWK, total keeps track the total of each arguments and count calculates the total number
echo AVG
awk  '/^Mem/ {total += $2; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
awk  '/^Mem/ {total += $3; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
awk  '/^Mem/ {total += $4; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
awk  '/^Mem/ {total += $5; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
awk  '/^Mem/ {total += $6; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
awk  '/^Mem/ {total += $7; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
awk  '/^Swap/ {total += $2; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
awk  '/^Swap/ {total += $3; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
awk  '/^Swap/ {total += $4; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
awk  '/home/ {total += $1; count++ } END {print total/count}' /home/$USER/metrics_agg_$dt.log
