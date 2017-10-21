#!/bin/bash
#
#  This script is only work for snmp test program. If you want to use it for any other program,which it could cause some critical problem.
#  Please make sure you have already know the issue for this script and have supervisor permission for further operation.
#  The script is only work for new installing CentOS7 Linux without network connections.
echo
echo "---------------------------------------------------------------------------------"
echo "||                                                                             ||"
echo "||                      The Shell Script Issues Review                         ||"
echo "||              1.Make sure all operate is in supervisor mode                  ||"
echo "||              2.Please put the CentOS image disc in CD-ROM.                  ||"
echo "||              3.There is no additional repository in the system              ||"
echo "||              4.The CentOS7 OS CD is in driver and have rights to read.      ||"
echo "||              5.Please do not disturb the process when script is running.    ||"
echo "||                                                         Author: Eason Xu    ||"
echo "---------------------------------------------------------------------------------"
echo
echo -e "\tScript is starting......\n"
echo -e "\tPlease wait the process......\n"
whoami|grep root
REVAL=$?
if [ $REVAL -ne 0 ];then
     echo "Please use 'root' for all operate steps."
     exit 0
else
    imgwd=/opt/images
    cwd=/etc/yum.repos.d/
    bwd=/usr/backup
    fn1=local.repo
    mkdir -p $imgwd
    mount /dev/sr0 $imgwd
    if [ ! -d $bwd ];then
         mkdir -p $bwd
    else
        mv $cwd/*.repo $bwd
    fi
    if [ ! -f $cwd$fn1 ];then
        echo "[Base]" >> $cwd$fn1
        echo "name=CentOS7.2 Repository" >> $cwd$fn1
        echo "baseurl=file:///home/cuser/images" >> $cwd$fn1
        echo "gpgcheck=0" >> $cwd$fn1
        echo "enable=1" >> $cwd$fn1
        yum update
    else
        for str in Base name baseurl gpgcheck enable
            do
                grep $str $cwd$fn1
                reval=$?
              if [ $reval -ne 0 ];then
                  echo "[Base]" >> $cwd$fn1
                  echo "name=CentOS7.2 Repository" >> $cwd$fn1
                  echo "baseurl=file:///home/cuser/images" >> $cwd$fn1
                  echo "gpgcheck=0" >> $cwd$fn1
                  echo "enable=1" >> $cwd$fn1
                  yum update
              else
                  echo
              fi
            done
    fi
fi
    yum install net-snmp net-snmp-devel net-snmp-utils -y