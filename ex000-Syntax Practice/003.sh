# Description - This script takes the length (L), width (W), height (H) of a rectangular cube and output its volume.
# How to run - ./003.sh 3 6 9

#!/bin/bash

# determine whether the arguments are missing
if [[ -z "$1" || -z "$2" || -z "$3" ]]
then
        echo "Arguments are missing."
        exit
fi

# determine whether the arguments are numbers
# RE='^[+-]?[0-9]+([.][0-9]+)?$'
RE='^[+-]?[1-9][0-9]*$'
if [[ !($1 =~ $RE) || !($2 =~ $RE) || !($3 =~ $RE) ]]
then
        echo "Arguments are not numbers."
        exit
fi

# determine whether the arguments are reasonable
if [[ $1 -lt 0 || $2 -lt 0 || $3 -lt 0  ]]
then
        echo "Arguments should be larger than 0."
        exit
fi

echo "The length (L) of the rectangular cube is: $1"
echo "The width (W) of the rectangular cube is: $2"
echo "The height (H) of the rectangular cube is: $3"
echo "The volume (V) of the rectangular cube is: $(($1 * $2 * $3))"