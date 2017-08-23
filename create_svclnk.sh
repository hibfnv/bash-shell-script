#!/bin/bash
# This script is used to create softlink in system
echo -r "Please Enter the filename: "
read name
# Check the filename
spath=/etc/init.d
destpath=/etc/rc.d
snum=`cat $spath/$name|head -n10|grep "chkconfig"|awk '{print $(NF-1)}'`
knum=`cat $spath/$name|head -n10|grep "chkconfig"|awk '{print $NF}'`
for i in `ls $destpath|grep rc..d|cut -b 3-6|awk -F'.' '{printf ("%d\n",$1)}'`
do
if [ -f $spath/$name ];then
    if [ $i -ge 3 ] && [ $i -lt 6 ];then
         ln -s $spath/$name $destpath/rc$i.d/S$snum$name
    else
         ln -s $spath/$name $destpath/rc$i.d/K$knum$name
    fi
    
else
    echo "$name is missing,make user you have type right."
fi
done