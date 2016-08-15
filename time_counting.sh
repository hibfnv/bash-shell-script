#!/bin/bash
# counting time script
echo -ne "033[34m\t\tCount:\033[0m"
tput sc
count=31
while true;
do
	if [ $count -ge 0 ];
	    then
	      count=$[ $count -1 ];
	      sleep 1;
	      tput rc
	      tput ed
	      echo -n $count;
	else
		exit 0
	fi
done
