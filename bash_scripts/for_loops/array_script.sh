#!/bin/bash
#
# Author: Takunda Nhau
# Date Created: 14/01/2026
# Last Modified: 14/01/2026
#
# Description:
#   Reads a list of URLs from a file and retrieves the HTTP response
#   headers for each URL using curl. The headers are saved to individual
#   text files named after each website.
#
# Usage:
#   ./check_sites.sh
#
# Input File:
#   urls.txt  (one URL per line)
#
# Notes:
#   - Uses readarray to load URLs into an array.
#   - curl --head retrieves HTTP headers only.
#   - Output files are named based on the domain portion of the URL.

# Read all URLs from urls.txt into an array called "urls"
readarray -t urls < urls.txt

# Loop through each URL in the array
for url in "${urls[@]}"; do
    # Extract the website name from the URL
    # Example: https://www.google.com → google
    webname=$(echo "$url" | cut -d "." -f 2)

    # Fetch HTTP headers and save them to a file named after the website
    curl --head "$url" > "$webname.txt"
done
