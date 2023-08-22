# Description - This script accepts two strings from the console and displays a message stating whether the strings are equal.

#!/bin/bash

echo -n "Input the 1st string:"
read STR1
echo -n "Input the 2nd string:"
read STR2
echo "The 1st string is: $STR1. The 2nd string is: $STR2."

if [[ $STR1 == $STR2 ]]
then
        echo "The 1st string is equal to the 2nd string"
else
        echo "The 1st string is not equal to the 2nd string"
fi