#!/bin/bash
#
# Author: Takunda Nhau
# Date Created: 19/01/2026
# Last Modified: 19/01/2026
#
# Description:
#   Logs system performance information including date, internet
#   connectivity status, memory usage, swap usage, and disk usage
#   to a log file named "performance.log".
#
# Usage:
#   ./performance_monitor.sh
#
# Notes:
#   - Uses ping to check internet connectivity.
#   - Captures RAM, swap, and disk usage statistics.
#   - Appends data to preserve historical records.
#   - Suitable for scheduling via cron.

LOGFILE="$HOME/performance.log"

# Log the current date and time
date >> "$LOGFILE"

# Check internet connectivity by pinging Google
ping -c 1 google.com &> /dev/null

if [ "$?" -eq 0 ]; then
    echo "Internet: Connected" >> "$LOGFILE"
else
    echo "Internet: Disconnected" >> "$LOGFILE"
fi

# Log RAM usage
echo "RAM Usage:" >> "$LOGFILE"
free -h | grep "Mem" >> "$LOGFILE"

# Log swap usage
echo "Swap Usage:" >> "$LOGFILE"
free -h | grep "Swap" >> "$LOGFILE"

# Log disk usage
echo "Disk Usage:" >> "$LOGFILE"
df -h >> "$LOGFILE"

# Add a blank line for readability between log entries
echo "" >> "$LOGFILE"

