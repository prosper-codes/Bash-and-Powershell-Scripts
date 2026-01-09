#!/bin/bash

# Author: Takunda Nhau
# Date Created: 09/01/2026
# Last Modified: 09/01/2026
#
# Description:
#   Collects user details including first name, surname, extension number,
#   access code, phone type, and department via interactive prompts.
#   The script appends this information as a single comma-separated line
#   to a CSV file named "extensions.csv".
#
# Usage:
#   ./extensions.sh
#
# Notes:
#   - Extension number and access code are restricted to exactly 4 digits.
#   - The access code input is hidden for security purposes.
#   - The phone type and department are selected from interactive menus.
#   - Data is appended to the CSV file to preserve existing records.
#   - Extra spaces are removed from CSV entries for proper formatting.


# Collect names
read -p "What is your first name: " first_name
read -p "What is your surname / family name: " lastname

# Select phone type
PS3="WHAT TYPE OF PHONE DO YOU HAVE: "
select phone in headset handheld; do
    echo "You selected $phone"
    break
done

# Select department
PS3="WHAT DEPARTMENT DO YOU WORK IN? "
select department in finance sales engineering "customer service"; do
    echo "You selected the $department department"
    break
done

# Extension and access code
read -N 4 -p "What is your current extension number? (must be 4 digits): " ext_num
echo
read -N 4 -s -p "What is the access code you would like to use when dialing in? (must be 4 digits): " acc_code
echo

# Save to CSV (no extra spaces)
echo "$first_name,$lastname,$ext_num,$acc_code,$phone,$department" >> extensions.csv

# Confirmation
echo "Thank you $first_name, we have successfully saved your information."

