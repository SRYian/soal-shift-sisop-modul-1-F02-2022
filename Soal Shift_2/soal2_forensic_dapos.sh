# awk -F[:\] '{ print $3}' ./log_website_daffainfo.log
# A.

# B.
awk -F[:\ ] '{ count++}END{print "Rata-rata serangan adalah sebanyak " (count-1)/12 " requests per jam"}' ./log_website_daffainfo.log >> forensic_log_website_daffainfo_log/ratarata.txt

# C.
awk -F[:\ ] '{ip[$1]++} END { for (i in ip) print "IP yang paling banyak mengakses server adalah: " i " sebanyak " ip[i]"  requests"}' ./log_website_daffainfo.log | sort -nk10,10 | tail -1 >> forensic_log_website_daffainfo_log/result.txt
# awk -F[:\ ] '{print $1}' ./log_website_daffainfo.log | sort | uniq -c | sort -k1,1

# D.cheating but idk if this'll work or not
awk -F[:\ ] '/curl/ {++n} END {print "Ada " n " requests yang menggunakan curl sebagai user-agent"}' ./log_website_daffainfo.log | sort >> forensic_log_website_daffainfo_log/result.txt
# awk -F[:\ ] '{print $11}' ./log_website_daffainfo.log | sort | uniq -c
# awk -F[:\ ] 'BEGIN {count=0;}  { if ($11 == "curl/7.54.0") count+=1} end {print $count}' ./log_website_daffainfo.log

# E.
awk -F[:\ ] '{if ($3 == "02") print $1}' ./log_website_daffainfo.log | sort -u >> forensic_log_website_daffainfo_log/result.txt
# {ip[$1]++} END { for (i in ip) print i, ip[i]}
# awk -F[:\ ] 'BEGIN { count=0; }  { if ( $3 == "02") cprint $1} end' ./log_website_daffainfo.log
