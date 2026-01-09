#!/bin/bash

PS3="WHAT IS THE DAY OF THE WEEK? :) :"

select day in mon tue wed thu fri sat sun;
do 
echo "day of the week is $day"
break
done
