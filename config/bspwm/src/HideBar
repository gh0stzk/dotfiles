#!/usr/bin/env bash
#  ██╗  ██╗██╗██████╗ ███████╗    ██████╗  █████╗ ██████╗ 
#  ██║  ██║██║██╔══██╗██╔════╝    ██╔══██╗██╔══██╗██╔══██╗
#  ███████║██║██║  ██║█████╗      ██████╔╝███████║██████╔╝
#  ██╔══██║██║██║  ██║██╔══╝      ██╔══██╗██╔══██║██╔══██╗
#  ██║  ██║██║██████╔╝███████╗    ██████╔╝██║  ██║██║  ██║
#  ╚═╝  ╚═╝╚═╝╚═════╝ ╚══════╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
#	Script to hide/show polybar or Eww bars.
#	Author: z0mbi3
#	url:    https://github.com/gh0stzk/dotfiles
#	19.07.2024 21:47:36

# Configuration
read -r current_rice < "$HOME"/.config/bspwm/.rice
CONF_FILE="$HOME/.config/bspwm/rices/$current_rice/Theme.sh"

# Function to get padding value from Theme.sh
get_padding() {
    grep "bspc config ${1}_padding" "$CONF_FILE" | awk '{print $NF}'
}

# Function to set BSPWM padding
set_padding() {
    bspc config top_padding $1
    bspc config bottom_padding $2
    bspc config left_padding $3
    bspc config right_padding $4
}

is_eww_theme() {
    case "$current_rice" in
        "z0mbi3"|"andrea")
            return 0 ;;
        *)
            return 1 ;;
    esac
}

get_eww_config_dir() {
    local base_dir="$HOME/.config/bspwm/rices/$current_rice"
    case "$current_rice" in
        "z0mbi3") echo "$base_dir/bar" ;;
        "andrea") echo "$base_dir/andy" ;;
    esac
}

# Function to handle bars
toggle_bar() {
    local action=$1

    if is_eww_theme; then
        local eww_config_dir=$(get_eww_config_dir)
        if [ "$action" = "hide" ]; then
            eww -c "$eww_config_dir" close bar
        else
            eww -c "$eww_config_dir" open bar
        fi
    else
        polybar-msg cmd $action
    fi
}

# Main function to hide or unhide bars
toggle_bars() {
    if [ "$1" = "hide" ]; then
        set_padding 2 2 2 2
        toggle_bar hide
    else
        set_padding $(get_padding "top") $(get_padding "bottom") $(get_padding "left") $(get_padding "right")
        toggle_bar show
    fi
}

# Parse command line argument
case $1 in
    -h|--hide) toggle_bars hide ;;
    -u|--unhide) toggle_bars unhide ;;
    *) echo "Usage: $0 {-h|--hide|-u|--unhide}" ;;
esac
