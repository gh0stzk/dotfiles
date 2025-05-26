TOP_PADDING="50"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"

# if we change the theme, the "apply_bar()" function in Theme.sh will set the bar to default
read -r CURRENT_BAR < "$HOME"/.config/bspwm/.bar

# path to the file with colors for the current theme
color_file=${HOME}"/.config/bspwm/rices/"${RICE}"/bar-colors.ini"

# path to the file with the selected bar
config_file=${HOME}"/.config/bspwm/rices/"${CURRENT_BAR}"/config.ini"

# changes the colors used for the bar
sed -i 's~include-file.*bar-colors.ini~include-file = '"$color_file"'~' "$config_file" 


# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$mon polybar -q emi-bar -c "${HOME}"/.config/bspwm/rices/"${CURRENT_BAR}"/config.ini &
done