#!/bin/sh
# This is a interactive softlink create scripts
# get user input
echo -n "Please enter the filename your want to create links: "
read name
# get path for file
# waiting for check next day
if [-f $name ]
   then
      ln -s $name destination_path/$name
else
  echo "Sorry, the filename you input was not found."
  exit 0
