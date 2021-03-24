#!/bin/bash


FILE=Config/Sensitive.robot
if [ -f "$FILE" ]; then
	echo "$FILE exists."
else
	echo "$FILE does not exist."
	echo 
	echo "Please provide a test account below:"
	read -p 'Username (email): ' uservar
	read -sp 'Password: ' passvar
	echo
	echo
	echo "*** Variables ***" > Config/Sensitive.robot
	echo "@{TEST} =  $uservar  $passvar" >> Config/Sensitive.robot
	echo "Thank you! Your changes have been written."
fi

