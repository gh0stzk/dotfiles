TOP_PADDING="35"
BOTTOM_PADDING="35"
LEFT_PADDING="1"
RIGHT_PADDING="1"

# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	(
    MONITOR=$mon polybar -q mel-bar -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	MONITOR=$mon polybar -q mel2-bar -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
    )
done
