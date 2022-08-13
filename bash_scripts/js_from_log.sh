#!/bin/bash

file_name=$1
paths=$(cat $1 | grep -o -e '\ \/.*\.js' | awk -F '/' '{print $NF}' | sort -u)
for path in $paths
do
	echo $path
done
