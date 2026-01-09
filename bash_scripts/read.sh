#!/bin/bash


#learning how to use the READ commang and the -p (prompt) and -t for time and  -s for secret

read -t 7 -p "Please enter your first name: "  first_name
read -s -t 5 -p "Please enter your age: " age
read -t 8 -p "Please enter your country of origin: " country 
 
echo "my first name is $name"
echo "I am $age old"
echo "I am from $country "


