#!/bin/sh
# =============================================================
# Author: gh0stzk
# Repo:   https://github.com/gh0stzk/dotfiles
# Date:   23.04.2025
#
# Script Name: ScreenLocker
# Description: Advanced screen locker with blur effect and theme-based wallpapers
# Features:
#   - Dynamic blur effect on screenshot
#   - Themed lockscreen wallpapers
#   - Customizable colors and fonts
#   - Multiple image format support (JPG/PNG/WEBP)
#   - Adaptive to screen resolution (Bye bye hardcoded values!)
#
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# Licensed under GPL-3.0 license
# =============================================================

TEMP_IMAGE="/tmp/i3lock.jpg"

# Colors
bg=#1a1b26
fg=#c0caf5
ring=#15161e
wrong=#f7768e
date=#c0caf5
verify=#9ece6a

# Get screen resolution dynamically
get_screen_resolution() {
    # Try xrandr first (most common)
    if command -v xrandr >/dev/null 2>&1; then
        resolution=$(xrandr | grep '\*' | awk '{print $1}' | head -n1)
    # Fallback to xdpyinfo
    elif command -v xdpyinfo >/dev/null 2>&1; then
        resolution=$(xdpyinfo | awk '/dimensions:/ {print $2}')
    # Last resort: use fixed resolution
    else
        resolution="1920x1080"
    fi
    
    SCREEN_WIDTH=$(echo $resolution | cut -d'x' -f1)
    SCREEN_HEIGHT=$(echo $resolution | cut -d'x' -f2)
}

# Calculate positions based on screen resolution
calculate_positions() {
    # Center horizontally
    CENTER_X=$((SCREEN_WIDTH * 25 / 100))  # Left position... 25% of screen width

    # Some other options:
    # CENTER_X=$((SCREEN_WIDTH / 2)) # Exact center (uncomment if preferred)
    # CENTER_X=$((SCREEN_WIDTH * 75 / 100)) # Right position...
    
    # Calculate vertical positions as percentages of screen height
    # Adjust these percentages to your preference
    TIME_Y=$((SCREEN_HEIGHT * 36 / 100))      # 36% from top
    DATE_Y=$((SCREEN_HEIGHT * 42 / 100))      # 42% from top
    IND_Y=$((SCREEN_HEIGHT * 56 / 100))       # 56% from top (indicator)
    VERIF_Y=$((SCREEN_HEIGHT * 76 / 100))     # 76% from top
    GREETER_Y=$((SCREEN_HEIGHT * 72 / 100))   # 72% from top
    WRONG_Y=$((SCREEN_HEIGHT * 76 / 100))     # 76% from top
    
    # Calculate font sizes based on screen resolution
    # Base sizes for 1920x1080, scale for other resolutions
    BASE_WIDTH=1920
    BASE_HEIGHT=1080
   
    # Scale factor formula...
    SCALE_FACTOR=$(echo "scale=2; sqrt(($SCREEN_WIDTH * $SCREEN_HEIGHT) / ($BASE_WIDTH * $BASE_HEIGHT))" | bc)
    
    # If bc is not available, use a simpler approach
    if [ -z "$SCALE_FACTOR" ]; then
        if [ $SCREEN_WIDTH -le 1366 ]; then
            SCALE_FACTOR=0.8
        elif [ $SCREEN_WIDTH -le 1920 ]; then
            SCALE_FACTOR=1.0
        elif [ $SCREEN_WIDTH -le 2560 ]; then
            SCALE_FACTOR=1.3
        else
            SCALE_FACTOR=1.5
        fi
    fi
    
    # Calculate font sizes
    TIME_SIZE=$(echo "140 * $SCALE_FACTOR" | bc | cut -d. -f1)
    DATE_SIZE=$(echo "45 * $SCALE_FACTOR" | bc | cut -d. -f1)
    TEXT_SIZE=$(echo "23 * $SCALE_FACTOR" | bc | cut -d. -f1)
    RADIUS=$(echo "30 * $SCALE_FACTOR" | bc | cut -d. -f1)
    RING_WIDTH=$(echo "60 * $SCALE_FACTOR" | bc | cut -d. -f1)
    
    # Fallback if bc is not available
    if [ -z "$TIME_SIZE" ]; then
        TIME_SIZE=140
        DATE_SIZE=45
        TEXT_SIZE=23
        RADIUS=30
        RING_WIDTH=60
    fi
}

default_lockscreen () {
    get_screen_resolution
    calculate_positions
    
    maim -d 0.3 -u ${TEMP_IMAGE}
    magick $TEMP_IMAGE -blur 5x4 $TEMP_IMAGE
    i3lock -n --force-clock -i $TEMP_IMAGE -e --indicator \
        --radius=$RADIUS --ring-width=$RING_WIDTH --inside-color=$bg \
        --ring-color=$ring --insidever-color=$verify --ringver-color=$verify \
        --insidewrong-color=$wrong --ringwrong-color=$wrong --line-uses-inside \
        --keyhl-color=$verify --separator-color=$verify --bshl-color=$verify \
        --time-str="%H:%M" --time-size=$TIME_SIZE --date-str="%a, %d %b" \
        --date-size=$DATE_SIZE --verif-text="Verifying Password..." --wrong-text="Wrong Password!" \
        --noinput-text="" --greeter-text="Type the password to Unlock" --ind-pos="$CENTER_X:$IND_Y" \
        --time-font="JetBrainsMono NF:style=Bold" --date-font="JetBrainsMono NF" --verif-font="JetBrainsMono NF" \
        --greeter-font="JetBrainsMono NF" --wrong-font="JetBrainsMono NF" --verif-size=$TEXT_SIZE \
        --greeter-size=$TEXT_SIZE --wrong-size=$TEXT_SIZE --time-pos="$CENTER_X:$TIME_Y" \
        --date-pos="$CENTER_X:$DATE_Y" --greeter-pos="$CENTER_X:$GREETER_Y" --wrong-pos="$CENTER_X:$WRONG_Y" \
        --verif-pos="$CENTER_X:$VERIF_Y" --date-color=$date --time-color=$date \
        --greeter-color=$fg --wrong-color=$wrong --verif-color=$verify \
        --pointer=default --refresh-rate=0 \
        --pass-media-keys --pass-volume-keys
}

rice_lockscreen () {
    get_screen_resolution
    calculate_positions
    
    # Current Rice
    read -r RICE < "$HOME"/.config/bspwm/.rice
    # Wallpapers dir
    image_dir="$HOME/.config/bspwm/rices/${RICE}/walls"

    # Select random image
    lock_image=$(find "$image_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)

    # If the image is *.webp convert to /tmp/lock_image.jpg
    case "$lock_image" in
        *.webp|*.jpg|*.jpeg|*.png)
            magick "$lock_image" "$TEMP_IMAGE" || exit 1
        ;;
    esac

    i3lock -n --force-clock -i $TEMP_IMAGE --scale -e --indicator \
        --radius=$RADIUS --ring-width=$RING_WIDTH --inside-color=$bg \
        --ring-color=$ring --insidever-color=$verify --ringver-color=$verify \
        --insidewrong-color=$wrong --ringwrong-color=$wrong --line-uses-inside \
        --keyhl-color=$verify --separator-color=$verify --bshl-color=$verify \
        --time-str="%H:%M" --time-size=$TIME_SIZE --date-str="%a, %d %b" \
        --date-size=$DATE_SIZE --verif-text="Verifying Password..." --wrong-text="Wrong Password!" \
        --noinput-text="" --greeter-text="Type the password to Unlock" --ind-pos="$CENTER_X:$IND_Y" \
        --time-font="JetBrainsMono NF:style=Bold" --date-font="JetBrainsMono NF" --verif-font="JetBrainsMono NF" \
        --greeter-font="JetBrainsMono NF" --wrong-font="JetBrainsMono NF" --verif-size=$TEXT_SIZE \
        --greeter-size=$TEXT_SIZE --wrong-size=$TEXT_SIZE --time-pos="$CENTER_X:$TIME_Y" \
        --date-pos="$CENTER_X:$DATE_Y" --greeter-pos="$CENTER_X:$GREETER_Y" --wrong-pos="$CENTER_X:$WRONG_Y" \
        --verif-pos="$CENTER_X:$VERIF_Y" --date-color=$date --time-color=$date \
        --greeter-color=$fg --wrong-color=$wrong --verif-color=$verify \
        --pointer=default --refresh-rate=0 \
        --pass-media-keys --pass-volume-keys
}

case $1 in
    -r|--rice)
        rice_lockscreen ;;
    -h|--help)
        echo -e "ScreenLocker [options]
Note: If an option is not specified, the screen locks with a screenshot with a blur effect.

Options:
	[-r] [--rice]	Set the screen locker with a random wallpaper of the current theme.\n" ;;
    *)
        default_lockscreen ;;
esac
