#!/usr/bin/env bash

dir="~/.config/bspwm/scripts"
rofi_command="rofi -theme $dir/thememenu.rasi"

# Options
emilia="󰔿 Emilia"
jan="󰔿 Jan"
aline="󰔿 Aline"
isabel="󰔿 Isabel"
andrea="󰔿 Andrea"
cynthia="󰔿 Cynthia"
silvia="󰔿 Silvia"
melissa="󰔿 Melissa"


# Variable passed to rofi
options="$emilia\n$jan\n$aline\n$isabel\n$andrea\n$cynthia\n$silvia\n$melissa"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 3)"
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
			$isabel)
				RICETHEME='isabel';
				cat <<< "$RICETHEME" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$andrea)
				RICETHEME='andrea';
				cat <<< "$RICETHEME" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$cynthia)
				RICETHEME='cynthia';
				cat <<< "$RICETHEME" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$silvia)
				RICETHEME='silvia';
				cat <<< "$RICETHEME" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$melissa)
				RICETHEME='melissa';
				cat <<< "$RICETHEME" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
		esac
	
