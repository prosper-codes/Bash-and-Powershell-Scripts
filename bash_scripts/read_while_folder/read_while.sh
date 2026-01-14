#!/bin/bash
#
# Author: Takunda Nhau
# Date Created: 14/01/2026
# Last Modified: 14/01/2026
#
# Description:
#   Reads a file line by line and creates a directory for each line.
#   Each line in the input file is treated as a directory name.
#
# Usage:
#   ./create_dirs.sh <filename>
#
# Example:
#   ./create_dirs.sh directories.txt
#
# Notes:
#   - The input file must contain one directory name per line.
#   - Quoting is used to safely handle directory names with spaces.
#   - Existing directories will cause mkdir to return an error.

# Read the input file line by line
while read -r line; do
    # Create a directory using the current line as the directory name
    mkdir -p "$line"
done < "$1"

