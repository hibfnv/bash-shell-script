#!/bin/bash
# Authorized by Eason
# This is a diskusage function script
 chkdir=" /var/log /home"
DATE=$(date '+%y%m%d')
exec > disk_usage_$DATE.rpt
echo "Top 10 Space Usage"
echo "For $chkdir Directories"
for dir in $chkdir
    do
       echo ""
       echo "The $chkdir Directory: "
       du -sh $dir 2>/dev/null|sort -rn|sed '{11,$D; =}'|sed 'N;s/\n/ /'|awk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
    done