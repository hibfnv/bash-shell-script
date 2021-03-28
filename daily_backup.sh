#!/bin/bash
# Authorized by eason
# Daily File Backup script
# Get current date
# use date function
DATE=`date +%y%m%d`
# Set Archive Filename
Fn=Archive$DATE.tar.gz
# Set Configuration File
config_fn=/home/$USER/archive/file_to_backup
dest_fn=/home/$USER/archive/$Fn
# Main Script in case
# Check the configure file first if not exit then show errors.
if [ -e $config_fn ];
   then
      echo
else
      echo -e "$config_fn is not exist.\n"
      echo "Make sure you have already create the configuration file."
      echo "The Backup is not completed...."
      exit 0
fi
# Build the name of all the files to backup
fn_no=1
exec < $config_fn
read f_name
while [ $? -eq 0];
      do
# Make sure the directories are all exist in case.
if [ -f $f_name -o -d $f_name ];
   then
# File exist then add to list
     f_list="$f_list $f_name"
   else
     # file not exist then show errors
      echo
      echo "$f_name is not exist."
      echo "The file will not bachup yet."
      echo "It is listed on Line $f_no of configure file."
      echo "continue to backup the files..."
      echo
fi
# set file no of configure file
f_no=$[ $f_no + 1 ]
read f_name
done
#
# backup the files
tar -czf $dest_fn $f_list 2>/dev/null
# end
