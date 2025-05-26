TOP_PADDING="42"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"

# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$mon polybar -q varinka-bar -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
done
