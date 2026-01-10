#!/bin/bash
#
# Author: Takunda Nhau
# Date Created: 09/01/2026
# Last Modified: 09/01/2026
#
# Description:
#   Checks for the existence of a "performance" directory in the user's
#   home directory and creates it if it does not exist. The script then
#   records current system memory usage and appends the output to a log
#   file named "memory.log".
#
# Usage:
#   ./memory_monitor.sh
#
# Notes:
#   - The script uses the "free" command to capture memory usage details.
#   - Output is appended to preserve historical memory data.
#   - Directory creation is handled safely if the folder does not exist.

# Check if the "performance" directory exists in the user's home directory

if [ -d "$HOME/performance" ]; then
    echo "Directory found"
else
    # Create the directory if it does not exist
    mkdir "$HOME/performance"
    echo "$HOME/performance folder has been created successfully"
fi

# Append current memory usage information to memory.log
free >> "$HOME/performance/memory.log"

