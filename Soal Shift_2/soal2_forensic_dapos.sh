# !/bin/bash
# A. 
# Literally this file

# commented code to test every single line is working
# awk -F[:\] '{ print $3}' ./log_website_daffainfo.log

# B.
# Flow: Separate each line with : -> count every line and exclude 1st one -> calculate average -> output to file
awk -F[:\ ] '{ count++}END{print "Rata-rata serangan adalah sebanyak " (count-1)/12 " requests per jam"}' ./log_website_daffainfo.log >> forensic_log_website_daffainfo_log/ratarata.txt

# C.
# Flow: Separate each line with : -> create an array of ip that will count the toal of every ip, for every string append the long string of Ip paling banyak...
# However, it does this to every single line -> pipe the output to a sort function, -nk will split the token using whitespace, if we take the 10th token as the sorting point
# we will get the biggest at the bottom -> get the bottom line using tail command-> output to file
awk -F[:\ ] '{ip[$1]++} END { for (i in ip) print "IP yang paling banyak mengakses server adalah: " i " sebanyak " ip[i]"  requests"}' ./log_website_daffainfo.log | sort -nk10,10 | tail -1 >> forensic_log_website_daffainfo_log/result.txt


# D.
# Flow Separate each line with : -> seearch the curl substring and increment n everytime it is found -> output to file
awk -F[:\ ] '/curl/ {++n} END {print "Ada " n " requests yang menggunakan curl sebagai user-agent"}' ./log_website_daffainfo.log | sort >> forensic_log_website_daffainfo_log/result.txt


# E.
# Flow Separate each line with : -> if it contains the substring 02 ->print the ip -> pipe the output to sort ->output to file
awk -F[:\ ] '{if ($3 == "02") print $1}' ./log_website_daffainfo.log | sort -u >> forensic_log_website_daffainfo_log/result.txt

