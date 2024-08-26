#	From here the processes necessary to be terminated when
#	you change the theme are killed.
#
#	This file is important for the correct functioning of the environment,
#	do not delete or modify it unless you know what you are doing.

	# This will remove polybar or eww bars when you switch from the current theme to another.
	if pgrep -x polybar > /dev/null; then
		polybar-msg cmd quit >/dev/null
	elif pgrep -f "eww.*bar" > /dev/null; then
		pkill -f "eww.*bar"
	fi

	# It is necessary to kill Dunst, otherwise the colorscheme does not change.
	pkill -x dunst

	# This will kill the fix for eww in fullscreen, we don't need it in themes with polybar.
	if pgrep -f "bspc subscribe node_state" > /dev/null; then
		pkill -f "bspc subscribe node_state"
	fi
	sleep 0.30
