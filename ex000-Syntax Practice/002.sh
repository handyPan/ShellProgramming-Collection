# Description - This script takes a list of files in the current directory and copies them into a sub-directory named mycopies.

#!/bin/bash

DEST_DIR="./mycopies"

# remove ./mycopies if it exists
if [ -d $DEST_DIR ]
then
        echo "$DEST_DIR exists."
        rm -r $DEST_DIR
        echo "$DEST_DIR removed."
fi

# list files and directories
TO_COPY=$(ls)

# create the destination directory
mkdir $DEST_DIR
echo "$DEST_DIR created."

# copy each file or directory from the current directory to the destination directory
for F_D in $TO_COPY
do
        if [ -d $F_D ]
        then
                cp -r $F_D "$DEST_DIR/$F_D"
                echo "Directory $F_D copied into $DEST_DIR."
        else
                cp $F_D "$DEST_DIR/$F_D"
                echo "File $F_D copied into $DEST_DIR."
        fi
done