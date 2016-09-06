#!/bin/sh
# Define function for system status
# Define server running days
function Uptimer {
clear
uptime|sed 's/,/ /g'|awk '{if ($4=="days"||$4=="day") {print $2,$3,$4,$5} else{print $2,$3}}'
}
function memusage {
clear
free|sed -n '2p'|awk '{x=(($3/$2)*100); print x}'|sed 's/$/%/g'
}
function dsusage {
clear
df -h
}
function menu {
echo -e "\t\t\tSystem Status Check Menu:\t\t\t"
echo
echo -e "\t1. Server Running Time.\t"
echo -e "\t2. Server Memory Usage.\t"
echo -e "\t3. Server Disc Usage.  \t"
echo -e "\t0. Exit."
echo -ne "\t\tPlease Enter Option: "

read -n 1 option
}
while [ 1 ]
do
menu
case $option in
0)
break
;;
1)
Uptimer
;;
2)
memusage
;;
3)
dsusage
;;
*)
echo "Please use [ 0,1,2,3 ] to get status."
esac
done
clear
