TOP_PADDING="43"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"

# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$mon polybar -q main -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
done
