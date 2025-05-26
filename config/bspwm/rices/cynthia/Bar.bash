TOP_PADDING="47"
BOTTOM_PADDING="47"
LEFT_PADDING="1"
RIGHT_PADDING="1"

# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	(
    MONITOR=$mon polybar -q cyn-bar -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar -q cyn-bar2 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
    )
done
