#!/usr/bin/env bash
#  ╦═╗╦╔═╗╔═╗  ╔═╗╔═╗╦  ╔═╗╔═╗╔╦╗╔═╗╦═╗  - z0mbi3
#  ╠╦╝║║  ║╣   ╚═╗║╣ ║  ║╣ ║   ║ ║ ║╠╦╝  - https://github.com/gh0stzk/dotfiles
#  ╩╚═╩╚═╝╚═╝  ╚═╝╚═╝╩═╝╚═╝╚═╝ ╩ ╚═╝╩╚═  - z0mbi3.zk@protonmail.com

bspwm_dir="$HOME/.config/bspwm"
rofi_command="rofi -dmenu -theme $bspwm_dir/scripts/RiceSelector.rasi"

# List rices
options=()
for dir in "$bspwm_dir"/rices/*/; do
    options+=("$(basename "$dir")")
done

# Show the rofi selection menu and store the result in a variable.
selected=$(printf "%s\n" "${options[@]}" | $rofi_command)

# If a valid option was selected, write the value to the configuration file and restart BSPWM.
[[ -n "$selected" ]] || exit 1
echo "$selected" > "${bspwm_dir}/.rice"
bspc wm -r

exit 0
