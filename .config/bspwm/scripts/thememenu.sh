#!/usr/bin/env bash

dir="~/.config/bspwm/scripts"
rofi_command="rofi -theme $dir/thememenu.rasi"

# Options
emilia="󰔿 Emilia"
jan="󰔿 Jan"
aline="󰔿 Aline"


# Variable passed to rofi
options="$emilia\n$jan\n$aline"

chosen="$(echo -e "$options" | rofi -theme $dir/thememenu.rasi -dmenu -selected-row 1)"
	case $chosen in

			$emilia)
				RICETHEME='emilia'
				cat <<< "$RICETHEME" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$jan)
				RICETHEME='jan'
				cat <<< "$RICETHEME" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$aline)
				RICETHEME='aline';
				cat <<< "$RICETHEME" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
		esac
	
