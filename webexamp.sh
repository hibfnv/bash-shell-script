#!/bin/sh

#  webexamp.sh
#  
find . -name "* (*)"|while read name;
do
na=$(echo $name|tr ' ','\(','\)')
mv "$name" $na;
done
find . -name "[A-Za-z0-9]{8,18}.jpg" -o -name "[A-Za-z0-9]{8,18}.jpeg"|while read str;
do
sub_fn=$(echo $str|tr -d '[A-Za-z]{1,32}'|cut -c -10);
mv "$str" sub_fn;
done
