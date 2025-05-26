TOP_PADDING="42"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"

read -r CURRENT_BAR < "$HOME"/.config/bspwm/.bar

color_file=${HOME}"/.config/bspwm/rices/"${RICE}"/bar-colors.ini"
config_file=${HOME}"/.config/bspwm/rices/"${CURRENT_BAR}"/config.ini"

sed -i 's~include-file.*bar-colors.ini~include-file = '"$color_file"'~' "$config_file" 


# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$mon polybar -q varinka-bar -c "${HOME}"/.config/bspwm/rices/"${CURRENT_BAR}"/config.ini &
done