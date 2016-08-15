#!/bin/sh
echo -ne "Please enter the file name:"
read name
#############################################################
#echo -ne "Please enter the destination path:"
#read dest_path
#echo $dest_path
#############################################################

path=/etc/init.d
basic=/etc/rc.d

num=`cat $path/$name|head -n10|grep chkconfig|awk '{print $4}'`
k_num=`cat $path/$name|head -n10|grep chkconfig|awk '{print $4}'`

path=/etc/init.d

if [ -f $path/$name ]
   then
      echo "$name is in the folder."
else
      echo "I can't found $name in the folder."
fi
for i in `ls $basic|grep [0-9]|tr -d 'rc'|tr -d '.d'`
do
   if [ $i -ge 3 ] && [ $i -le 5 ]
	then
ln -s $path/$name $basic/rc$i.d/S$num$name
else
ln -s $path/$name $basic/rc$i.d/K$k_num$name
fi
done
