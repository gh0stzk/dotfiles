TOP_PADDING="1"
BOTTOM_PADDING="53"
LEFT_PADDING="1"
RIGHT_PADDING="1"

# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$mon polybar -q cristina-bar -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
done
