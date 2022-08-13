#!/bin/bash
## get the ip and hostname of subdomains from main page of provided domain


domain=$1

main_page="www.$domain"
echo -e "Finding subdomains of $domain from $main_page...\n"

re='[^/,"]*.'$domain
re=$(echo $re | sed -e 's/\./\\./g')

index=$(curl $main_page 2>/dev/null | grep -o $re | sort -u)

for sub_domain in $index
do
	echo $(host -4 -t CNAME $sub_domain | awk -F " " '{print $1" - "$4}')
done
