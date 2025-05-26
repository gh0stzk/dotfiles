TOP_PADDING="53"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"

read -r CURRENT_BAR < "$HOME"/.config/bspwm/.bar

color_file=${HOME}"/.config/bspwm/rices/"${RICE}"/bar-colors.ini"
config_file=${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini"

sed -i 's~include-file.*bar-colors.ini~include-file = '"$color_file"'~' "$config_file" 


# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
		(
	MONITOR=$mon polybar -q pam1 -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
	MONITOR=$mon polybar -q pam2 -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
	MONITOR=$mon polybar -q pam3 -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
	MONITOR=$mon polybar -q pam4 -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
	MONITOR=$mon polybar -q pam5 -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
	MONITOR=$mon polybar -q pam6 -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
		)
done