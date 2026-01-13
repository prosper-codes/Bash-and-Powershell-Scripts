#!/bin/bash
#
# Author: Takunda Nhau
# Date Created: 13/01/2026
# Last Modified: 13/01/2026
#
# Description:
#   Converts temperatures between Celsius and Fahrenheit using command-line
#   options. The script accepts numeric input values and performs floating-
#   point calculations using the bc utility.
#
# Usage:
#   ./temp_convertor.sh -c <celsius_value>
#   ./temp_convertor.sh -f <fahrenheit_value>
#
# Examples:
#   ./temp_convertor.sh -c 25
#   ./temp_convertor.sh -f 77
#
# Notes:
#   - Uses getopts for option parsing.
#   - Supports floating-point arithmetic via bc.
#   - Output is rounded to two decimal places.

# Parse command-line options
while getopts "f:c:" option; do
    case "$option" in
        # Convert Celsius to Fahrenheit
        c)
            result=$(echo "scale=2; ($OPTARG * (9/5)) + 32" | bc)
            ;;
        # Convert Fahrenheit to Celsius
        f)
            result=$(echo "scale=2; ($OPTARG - 32) * (5/9)" | bc)
            ;;
        # Handle invalid options
        \?)
            echo "Invalid option. Use -c or -f."
            exit 1
            ;;
    esac
done

# Print the conversion result
echo "$result"



