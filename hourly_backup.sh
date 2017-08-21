#!/bin/bash
# Authorized by eason
# Hourly Backup Script
# Set Configure File
conf_fn=/home/$USER/archive/hourly/file_backup
# Set base destination
base_dest=/home/$USER/archive/hourly
# Get Day,Month and Time
DAY='date +%d'
MON='date +%m'
TIME='date +%K%M'
# Create Backup Directory
mkdir -p $base_dest/$MON/$DAY
# Build Destionation file name
dest_fn=$base_dest/$MON/$DAY/Archive$TIME.tar.gz
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
     f_list=""$f_list $f_name"
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
