#!/bin/bash
# This shell used to clean the log file which it is more than 1 day with the IP keywords.
# Use this shell please make sure you have know that the log files are useless for the system.
echo "Clean the log file which it is more than 1 day."
echo "Beginning clean..."
find /var/log -name "10.71.*" -mtime +1 -exec rm -f {} \;
echo "Done..."
