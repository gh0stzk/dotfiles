#	From here the processes necessary to be terminated or reloaded, when
#	you change the theme.
#
#	This file is important for the correct functioning of the environment,
#	do not delete or modify it unless you know what you are doing.

	# This will remove polybar or eww bars when you switch from the current theme to another.
	if pgrep -x polybar > /dev/null; then
		polybar-msg cmd quit >/dev/null
	elif pgrep -f "eww.*bar" > /dev/null; then
		pkill -f "eww.*bar"
	fi

	# It is necessary to kill Dunst, otherwise the dunst notifications colorscheme does not change.
	pkill -x dunst

	# This will kill the fix for eww in fullscreen, we don't need it in themes with polybar.
	if pgrep -f "bspc subscribe node_state" > /dev/null; then
		pkill -f "bspc subscribe node_state"
	fi
	sleep 0.30

	# Load random wallpaper depending on the theme you are.
	feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls

# Explanation: Why are some applications or daemons started or killed here and others in bspwmrc?

# There are applications and/or daemons that we do not need to be reloaded every time we change from
# one theme to another, such is the case of the xshkd or picom or eww daemon, these daemons only need to be
# run once and they work for all themes, they do not need be killed and started every time you change the
# theme or change its configuration. And these go in bspwmrc file.

# But there are others that when you change the theme, you need them to be killed and restarted with the
# configuration of the new theme you changed to, such as polybar, dunst notification daemon or feh to set
# the wallpaper depending on the theme you are in. Those go in this file.

# All this is because when you change from theme to another, bspwm is NO LONGER reloaded, which means that
# the bspwm configuration file [bspwmrc] is no longer loaded every time you change from one theme to another.
# This brings several advantages, such as fluidity when switching between themes, less overload on the system
# since only the processes or apps that we need to be restarted are restarted.
