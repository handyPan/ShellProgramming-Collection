# Description - This script accepts the input of a username and displays the user's id number (UID), group id number (GID), and home directory.

#!/bin/bash

echo -n "Input the username:"
read USER_NAME

# retrieve the record for the user
USER_RECORD=$(cat /etc/passwd | grep $USER_NAME)
if [[ -z "$USER_RECORD" ]]
then
        echo "User does not exist. Try again."
        exit
fi

echo "The user id number (UID) is: " $(echo $USER_RECORD | cut -d ':' -f 3)
echo "The group id number (GID) is: " $(echo $USER_RECORD | cut -d ':' -f 4)
echo "The home directory is: " $(echo $USER_RECORD | cut -d ':' -f 6)