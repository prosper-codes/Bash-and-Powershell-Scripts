#!/bin/bash
# Author: Takunda Nhau
# Date Created: 05/01/2026
# Last Modified: 05/01/2026
#
# Description:
#   Collects user details (first name, surname, extension number, and access code)
#   via interactive prompts and appends the information to a CSV file
#   named "extensions.csv".
#
# Usage:
#   ./extensions.sh
#
# Notes:
#   - Extension number and access code are restricted to exactly 4 characters.
#   - The access code input is hidden for security purposes.
#   - Data is appended to the CSV file to preserve existing records.


read -p "What is your first name: " first_name
read -p  "What is your surname /family name: " lastname
read -N 4 -p  "What is your current extension number? (must be 4 digits): " ext_num
echo
read -N 4 -s -p "What is the  access code would you like to use when dialing in? (must be 4 digits): " acc_code
echo


echo "$first_name, $lastname ,$ext_num ,$acc_code" >> extensions.csv 
echo "Thank you $first_name we have successfully saved your information"
