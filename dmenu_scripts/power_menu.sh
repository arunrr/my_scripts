#!/usr/bin/env bash
# This program emulates a power menu using dmenu

# Specify a terminal
term=alacritty

# Add commands for the power menu
declare -A commands

commands+=(['Shutdown']='sudo systemctl poweroff'
	   ['Restart']='sudo systemctl reboot' 
	   ['Sleep']='sudo systemctl suspend' 
	)

# Select a command 
selected_command=$(for key in "${!commands[@]}"
		   do
			   echo $key
		   done | dmenu -i -l 5 -p "Select a command"
		 )

# Execute the selected command
if [ -v commands[$selected_command] ];then
	$term -e "${commands[$selected_command]}"
fi

