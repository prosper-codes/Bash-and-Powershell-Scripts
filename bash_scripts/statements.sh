#!/bin/bash
#
# Author: Takunda Nhau
# Date Created: 11/01/2026
# Last Modified: 11/01/2026
#
# Description:
#   Displays an interactive menu of cities using Bash's select construct.
#   Based on the user's selection, the script determines and prints the
#   corresponding country for the chosen city.
#
# Usage:
#   ./city_country.sh
#
# Notes:
#   - Uses the PS3 prompt to customize the select menu message.
#   - Supports cities from multiple countries.
#   - Groups cities from the same country using case pattern matching.
#   - Exits after a single valid selection.

# Custom prompt shown by the select menu
PS3="What is the city you want: "

# Display a menu of cities and prompt the user to make a selection
select city in Tokyo London "Los Angeles" Moscow Dubai Manchester "New York" Paris Bangalore Johannesburg Istanbul Milan "Abu Dhabi" Pune Nairobi Berlin Karachi
do
    # Match the selected city to its corresponding country
    case "$city" in
        Tokyo)
            echo "Country: Japan"
            ;;
        London|Manchester)
            echo "Country: United Kingdom"
            ;;
        "Los Angeles"|"New York")
            echo "Country: United States"
            ;;
        Moscow)
            echo "Country: Russia"
            ;;
        Dubai|"Abu Dhabi")
            echo "Country: United Arab Emirates"
            ;;
        Paris)
            echo "Country: France"
            ;;
        Bangalore|Pune)
            echo "Country: India"
            ;;
        Johannesburg)
            echo "Country: South Africa"
            ;;
        Istanbul)
            echo "Country: Turkey"
            ;;
        Milan)
            echo "Country: Italy"
            ;;
        Nairobi)
            echo "Country: Kenya"
            ;;
        Berlin)
            echo "Country: Germany"
            ;;
        Karachi)
            echo "Country: Pakistan"
            ;;
        *)
            # Handle invalid menu selections
            echo "Invalid selection"
            ;;
    esac

    # Exit the menu after one selection
    break
done

