#!/bin/sh
for i in `cat md5csum`
do
no=`cat md5fn|grep $i|wc -l`
if [ $no -ge 2 ]
 then
cat md5fn|grep $i|head -n1|awk -F '  ' '{print $NF}' >> sortfn
else
cat md5fn|grep $i|awk -F '  ' '{print $NF}' >> sortfn
fi
done
