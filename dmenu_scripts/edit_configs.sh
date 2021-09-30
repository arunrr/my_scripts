#!/usr/bin/env bash

# Specify editor of choice to open the config file
editor='nvim'

# Specify terminal of choice
term='alacritty'

# Add config files
declare -A config_files

config_files+=(['alacritty']=$HOME/.config/alacritty/alacritty.yml
	       ['bspwm']=$HOME/.config/bspwm/bspwmrc
	       ['sxhkd']=$HOME/.config/sxhkd/sxhkdrc
	       ['polybar']=$HOME/.config/polybar/config

	      )

# Get the config file name from dmenu
config_file=$(for key in "${!config_files[@]}"
	      do
		echo $key
	      done | dmenu -i -l 10 -p 'Edit Config')

# if there exists a config path for the selected file name then edit the file
if [ -v config_files[$config_file] ];then
		$term -e $editor ${config_files[$config_file]}
fi