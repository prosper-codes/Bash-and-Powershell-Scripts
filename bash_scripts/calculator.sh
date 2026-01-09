#!/bin/bash

#operation=$1
#num_1=$2
#num_2=$3

#result=$(( num_1 $operation num_2 ))

#echo "you are performing $operation"
#echo "your result is $result"
echo  $(( $@ ))

