#!/bin/bash
webpage=$1

wget -q $webpage && echo "Downloaded index.html" || echo "Download Failed"
# Remove the protocol (http://, https://) and 'www.' prefix
domain=$(echo "$webpage" | sed -E 's#https?://##' | sed -E 's#www\.##')

# Extract the main part before the first dot (.)
main_part=$(echo "$domain" | awk -F '.' '{print $1}')
grep "href=" index.html | grep "\.$main_part" | grep -v "www\.$main_part\.com" | awk -F "http://" '{print $2}'| cut -d "/" -f 1 > list.txt
for url in $(cat list.txt); do host $url; done








