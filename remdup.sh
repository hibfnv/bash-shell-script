#!/bin/sh

#  remdup.sh
#  

cat source.txt|awk -F ' ' '{print $1}'|while read line
do
num=`cat source.txt|grep "$line"|wc -l`
if [ $num -gt 1 ]
then
cat source.txt|grep "$line" >> sourlist.txt
else
echo "Nothing need to do."
fi
done
