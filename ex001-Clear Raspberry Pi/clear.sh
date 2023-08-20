#!/bin/bash
echo "Clear unnecessary python files ..."

#remove desktop files and downloaded files
find /home/pi/Desktop 2>/dev/null > /home/pi/tmp.txt
find /home/pi/Downloads 2>/dev/null >> /home/pi/tmp.txt
str1="/home/pi/Desktop/clear.sh"
while read -r file1
do
	if [[ "$file1" != *"$str1"* && "$file1" != "/home/pi/Desktop" && "$file1" != "/home/pi/Downloads" ]]
	then	
		sudo rm -rf "$file1"
		echo "$file1 removed."
	fi
done < /home/pi/tmp.txt

#remove the .py files of specified paths
find / -type f -name "*.py" 2>/dev/null > /home/pi/tmp.txt
str2="/home/pi/Desktop"
while read -r file2
do
	if [[ "$file2" == *"$str2"* ]]
	then	
		sudo rm -rf "$file2"
		echo "$file2 removed."
	fi
done < /home/pi/tmp.txt

#remove the files and directories of specified paths
find /home/pi 2>/dev/null > /home/pi/tmp.txt
paths_excluded=("/." "/Desktop" "/Documents" "/Downloads" "/Home" \
		"/Music" "/opencv" "/Pictures" "/Public" "/Templates" "/thinclient_drives" "/Videos")
while read -r file3
do
	if [[ "$file3" == "/home/pi" ]]
	then
		continue
	fi
	for path in "${paths_excluded[@]}"
	do
		if [[ "$file3" == *"$path"* ]]
		then
			continue 2
		fi
	done
	#remove other files
	sudo rm -rf "$file3"
	echo "$file3 removed."
done < /home/pi/tmp.txt

#remove the tmp file
sudo rm -rf /home/pi/tmp.txt
echo "/home/pi/tmp.txt removed."

#empty trash
sudo rm -rf ~/.local/share/Trash/*
echo "Trash emptied."