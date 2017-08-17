#!/bin/bash
# This is a script that Installing Google-Authenticator for Linux OS which was build by Redhat kernel.
# check where there's needed softwares, if no then download and installing.
for i in gcc pam-devel make autoconf automake git
    do
      `rpm -qa|grep $i`
           if [ $? -eq 0 ];then
           echo $i" is ok."
       else
           yum install -y $i
    done
    
# User create script for Linux OS
echo "Please enter username you want: "
read name
echo "Enter the Full name you used: "
read fname
useradd -c "$fname" -d /home/$name -m $name -s /bin/bash
    