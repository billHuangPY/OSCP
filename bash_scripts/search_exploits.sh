#!/bin/bash
# Bash script to search for a given exploit and download all matches.
# copy and modified

echo -e "Searching exploits for $@...\n"
for e in $(searchsploit $@ -w -t | grep http | cut -f 2 -d "|")

do
  exp_name=$(echo $e | cut -d "/" -f 5)
  url=$(echo $e | sed 's/exploits/raw/')
  wget -q --no-check-certificate $url -O "exploit_$exp_name"
  echo "exploit_$exp_name downloaded"
done




