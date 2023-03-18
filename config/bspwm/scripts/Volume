#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>

# Icons
iDIR="$HOME/.config/bspwm/assets"
notify_cmd='dunstify -u low -h string:x-dunst-stack-tag:obvolume'

# Get Volume
get_volume() {
	pamixer --get-volume-human | sed 's/%//'
}

# Get icons
get_icon() {
	current="$(get_volume)"
	if [[ "$current" -eq "0" ]]; then
		icon="$iDIR/mute.png"
	elif [[ "$current" == "muted" ]]; then
		icon="$iDIR/mute.png"
	elif [[ ("$current" -ge "0") && ("$current" -le "150") ]]; then
		icon="$iDIR/vol.png"
	fi
}

# Notify
notify_user() {
	${notify_cmd} -i "$icon" "Volume : $(get_volume)%"
}

# Increase Volume
inc_volume() {
	[[ $(pamixer --get-mute) == true ]] && pamixer -u
	pamixer --allow-boost --set-limit 150 -i 5 && get_icon && notify_user
}

# Decrease Volume
dec_volume() {
	[[ $(pamixer --get-mute) == true ]] && pamixer -u
	pamixer --allow-boost --set-limit 150 -d 5 && get_icon && notify_user
}

# Toggle Mute
toggle_mute() {
	if [[ $(pamixer --get-mute) == false ]]; then
		pamixer --toggle-mute && ${notify_cmd} -i "$iDIR/mute.png" "Mute"
	else
		pamixer --toggle-mute && get_icon && ${notify_cmd} -i "$icon" "Unmute"
	fi
}

# Execute accordingly
if [[ -x $(which pamixer) ]]; then
	if [[ "$1" == "--get" ]]; then
		get_volume
	elif [[ "$1" == "--inc" ]]; then
		inc_volume
	elif [[ "$1" == "--dec" ]]; then
		dec_volume
	elif [[ "$1" == "--toggle" ]]; then
		toggle_mute
	else
		echo "$(get_volume)%"
	fi
else
	${notify_cmd} "'pamixer' is not installed."
fi
