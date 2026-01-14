#!/bin/bash
#
# Author: Takunda Nhau
# Date Created: 14/01/2026
# Last Modified: 14/01/2026
#
# Description:
#   Creates a simple countdown timer using minutes and seconds provided
#   via command-line options. The timer counts down to zero and prints
#   the remaining time every second.
#
# Usage:
#   ./timer.sh -m <minutes> -s <seconds>
#
# Example:
#   ./timer.sh -m 1 -s 30
#
# Notes:
#   - Uses getopts for option parsing.
#   - Time is internally stored and processed in seconds.
#   - Uses sleep to create a real-time countdown.

# Initialize total seconds
total_seconds=0

# Parse command-line options
while getopts "m:s:" opt; do
    case "$opt" in
        # Convert minutes to seconds and add to total
        m)
            total_seconds=$(( total_seconds + OPTARG * 60 ))
            ;;
        # Add seconds to total
        s)
            total_seconds=$(( total_seconds + OPTARG ))
            ;;
        # Handle invalid options
        \?)
            echo "Usage: $0 -m <minutes> -s <seconds>"
            exit 1
            ;;
    esac
done

# Countdown loop
while [ "$total_seconds" -gt 0 ]; do
    echo "$total_seconds"
    total_seconds=$(( total_seconds - 1 ))
    sleep 1
done

# Final message
echo "Time's up!"

