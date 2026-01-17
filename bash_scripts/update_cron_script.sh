#!/bin/bash
#
# Author: Takunda Nhau
# Date Created: 17/01/2026
# Last Modified: 17/01/2026
#
# Description:
#   Performs a system update and upgrade on a Debian/Ubuntu system,
#   and automatically reboots the machine if a reboot is required.
#
# Usage:
#   ./auto_update.sh
#
# Notes:
#   - Uses 'apt -y' to automatically confirm prompts.
#   - Checks for the presence of /var/run/reboot-required to determine
#     if a reboot is needed.
#   - Can be scheduled via cron (example provided at the bottom).
#   - Requires root privileges to run successfully.

# Update package lists
apt -y update

# Upgrade installed packages
apt -y upgrade

# Check if a reboot is required and perform it if necessary
if [ -f /var/run/reboot-required ]; then
    echo "Reboot required. Rebooting now..."
    reboot
fi

# Example cron job to run this script daily at midnight:
# 00 00 * * * /path/to/update_cron_script.sh
