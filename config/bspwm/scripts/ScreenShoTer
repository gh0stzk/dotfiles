#!/usr/bin/env bash
#  ╔═╗╔═╗╦═╗╔═╗╔═╗╔╗╔╔═╗╦ ╦╔═╗╔╦╗╔═╗╦═╗
#  ╚═╗║  ╠╦╝║╣ ║╣ ║║║╚═╗╠═╣║ ║ ║ ║╣ ╠╦╝
#  ╚═╝╚═╝╩╚═╚═╝╚═╝╝╚╝╚═╝╩ ╩╚═╝ ╩ ╚═╝╩╚═
#	Modified by z0mbi3 https://github.com/gh0stzk

time=$(date +%Y-%m-%d-%I-%M-%S)
geometry=`xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current'`
dir="$(xdg-user-dir PICTURES)/ScreenShots"
file="ShoT_${time}_${geometry}.png"

	if ! [ -d "$dir" ]; then
		mkdir -p $dir
	fi

function notify_view() {
	if [[ -e "$dir/$file" ]]; then
		dunstify --replace=699 -i $dir/$file Screenshot "Screenshot Saved"
	else
		dunstify --replace=699 -i $dir/$file Screenshot "Screenshot Deleted."
	fi
}

function imgtemp() {
	if [ "$bytes" ]; then
		echo "$bytes" | base64 --decode | tee "$file"
		notify_view
	else
		dunstify -i ~/.config/bspwm/assets/cancel.svg Screenshot "Operation Cancelled."
	fi
}

function countdown() {
	for sec in `seq $1 -1 1`; do
		dunstify -t 1000 --replace=699 -i  ~/.config/bspwm/assets/screenshot.svg "Taking shot in : $sec"
		sleep 1
	done
}

function ShotNow() {
	
	cd "$dir" || return
	local bytes
	bytes="$(maim -u -o -f png | base64)"
	imgtemp
}

function ShotSelect() {
	
	cd "$dir" || return
	local bytes
	bytes="$(maim -u -o -f png -s -b 2 -c 0.35,0.55,0.85,0.25 -l | base64)"
	imgtemp
}

function Shot10 () {
	countdown '10'
	sleep 1 
	cd "$dir" || return
	local bytes
	bytes="$(maim -u -o -f png | base64)"
	imgtemp
}

if [[ "$1" == "--now" ]]; then
	ShotNow
elif [[ "$1" == "--sel" ]]; then
	ShotSelect
elif [[ "$1" == "--in10" ]]; then
	Shot10
else
	echo -e "Available Options : --now --in10"
fi

exit 0
