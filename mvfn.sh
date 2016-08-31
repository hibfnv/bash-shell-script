#!/bin/sh
SAVEIFS=$IFS
IFS=$(echo -ne "\n\b")
for fn in `cat sortfn`
do
mv "$fn" ./Back
done
IFS=$SAVEIFS
