# Description - This script accepts the principal, rate, and time from the user as command line arguments and output the results of simple interest.
# Note - since bash can't have float input, an input of rate 5 is actually 5%
# How to run - ./005.sh 1000 5 3

#!/bin/bash

# define the function to display simple interest
displaySimpleInterest() {
        echo "The principal (P) is: $1"
        echo "The rate (R) is: $2%"
        echo "The time (T) is: $3"
        echo "The simple interest (SI) is: $(( $1 * $2 * $3 / 100 ))"
}

# invoke the function with the command line arguments passed
if [[ -z "$1" || -z "$2" || -z "$3" ]]
then
        echo "Arguments are missing."
        exit
elif [[ $1 -lt 0 || $2 -lt 0 || $3 -lt 0 ]]
then
        echo "Arguments should be larger than 0."
        exit
else
        displaySimpleInterest $1 $2 $3
fi