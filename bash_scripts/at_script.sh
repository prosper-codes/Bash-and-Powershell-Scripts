#!/bin/bash
#
# Author: Takunda Nhau
# Date Created: 17/01/2026
# Last Modified: 17/01/2026
#
# Description:
#   Creates a directory named "at_dir" (if it does not already exist)
#   and generates 100 empty text files inside it, named sequentially
#   from file1.txt to file100.txt.
#
# Usage:
#   ./create_files.sh
#
# Notes:
#   - Uses mkdir -p to avoid errors if the directory already exists.
#   - Uses a while loop to control file creation.
#   - Files are created using the touch command.

# Create the directory if it does not already exist
mkdir -p at_dir

# Initialize counter
i=1

# Loop until 100 files have been created
while [ "$i" -le 100 ]; do
    # Create an empty file with an incremental number in its name
    touch "at_dir/file$i.txt"

    # Increment the counter
    i=$((i + 1))
done

