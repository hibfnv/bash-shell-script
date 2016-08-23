X#!/bin/sh

#  string_ren.sh
#  
find . -name "*.jpg" -o -name "*.jpeg" -o -name "*.JPG"|while read str;
do
no=1
path=`echo $str|awk -F '/' '{for(i=1;i<NF;i++)printf $i"/";}'`;
sub_fn=`echo $str|awk -F '/' '{print $NF}'|sed 's/[A-Za-z]//g'|tr -d '.',' ','\(','\)','/','-','!'`;
no=$[ $no + 1 ]
mv "$str" "$path"$no$sub_fn.jpg;
done