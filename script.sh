#!/bin/bash

webpage=$1

# Download the webpage
wget -q "$webpage" && echo "Downloaded index.html" || { echo "Download Failed"; exit 1; }

# Remove the protocol (http://, https://) and 'www.' prefix
domain=$(echo "$webpage" | sed -E 's#https?://##' | sed -E 's#www\.##')

# Extract the main part before the first dot (.)
main_part=$(echo "$domain" | awk -F '.' '{print $1}')

# Extract domain-related URLs from the downloaded page
grep -oP 'http[s]?://[^/]*\.'"$main_part"'\.com' index.html | sort -u > list.txt

# Perform DNS resolution for each URL in list.txt
while IFS= read -r url; do
    host "$url"
done < list.txt
