#!/bin/bash
## Exercise 1 to perform ping sweep, using nmap to get list of ip
## and use fping to perform the scan

ip_list=$(nmap -sL $@ | grep for | cut -d " " -f 5)
for ip in $ip_list
do
  if [ $(fping $ip | grep -c 'alive') -ne 0 ] 
  then
    echo "$ip is alive"
  fi
done
