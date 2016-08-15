#!/bin/sh
# This is a interactive softlink create scripts
# get user input
echo -n "Please enter the filename your want to create links: "
read name
echo
echo -ne "\033[35mEnter the path of the $name: \033[0m"
read path

# Find the path first, then check file name.

if [ -e $path ]
then
echo -ne "\033[35mGreat, $path founded.\033[0m"
else
echo -ne "\033[35mThere's no $path.\033[0m"
fi

# File name checked in this section

if [ -f name ]
then
echo -ne "\033[35m$name was found.\033[0m"
else
echo -ne "\033[35mSorry, I can't find $name.\033[0m"
      exit 0
fi
