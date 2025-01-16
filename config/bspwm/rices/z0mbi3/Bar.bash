# This file launch the bar/s
eww -c "${HOME}"/.config/bspwm/rices/"${RICE}"/bar open --toggle bar

	# Fix eww,  when entering fullscreen state
	bspc subscribe node_state | while read -r _ _ _ _ state flag; do
		[[ "$state" == "fullscreen" ]] || continue
			if [ "$flag" == on ]; then
				HideBar -h
			else
				HideBar -u
			fi
	done &
