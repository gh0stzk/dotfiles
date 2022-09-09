#!/bin/bash

# Author 	 -  z0mbi3
# Source 	 -  https://github.com/gh0stzk/dotfiles
# Maintainer -  z0mbi3.zk@protonmail.com

ewwconf="eww -c $HOME/.config/bspwm/rices/z0mbi3/dashboard"

weather() {
	$HOME/.config/bspwm/rices/z0mbi3/dashboard/scripts/weather --getdata
}

function toggle() {
    $ewwconf $1 sidebar pfp date music weather system
}

WINDOWS=`$ewwconf windows | grep system | grep "*"`
[ "$WINDOWS" = "" ] && toggle "open-many" || toggle "close"

weather
