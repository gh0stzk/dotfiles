#!/usr/bin/env bash

# Author 	 -  z0mbi3
# Source 	 -  https://github.com/gh0stzk/dotfiles
# Maintainer -  z0mbi3.zk@protonmail.com

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
pamela="󰔿 Pamela"


# Variable passed to rofi
options="$emilia\n$jan\n$aline\n$isabel\n$andrea\n$cynthia\n$silvia\n$melissa\n$pamela"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
	case $chosen in

			$emilia)
				cat <<< "emilia" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$jan)
				cat <<< "jan" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$aline)
				cat <<< "aline" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$isabel)
				cat <<< "isabel" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$andrea)
				cat <<< "andrea" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$cynthia)
				cat <<< "cynthia" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$silvia)
				cat <<< "silvia" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$melissa)
				cat <<< "melissa" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
			$pamela)
				cat <<< "pamela" > $HOME/.config/bspwm/rice.cfg
				bspc wm -r
				;;
		esac
	
