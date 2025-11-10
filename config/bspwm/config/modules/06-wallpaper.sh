#!/bin/sh

pick_random_wall() {
    find "$1" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | shuf -n 1
}

    case $ENGINE in
        "Random")
            random_img=$(pick_random_wall "$HOME/.config/bspwm/rices/$RICE/walls")
            feh --bg-fill "$random_img"
            WallSync &
            ;;
        "CustomDir")
            random_img=$(pick_random_wall "$CUSTOM_DIR")
            feh --bg-fill "$random_img"
            WallSync &
            ;;
        "Default")
            feh --bg-fill "$DEFAULT_WALL"
            WallSync &
            ;;
        "Animated")
            AnimatedWall --start "$ANIMATED_WALL"
            WallSync --animated &
            ;;
        "Slideshow")
            (
                while :; do
                    random_img=$(pick_random_wall "$HOME/.config/bspwm/rices/$RICE/walls")
                    feh --bg-fill "$random_img"
                    WallSync
                    sleep 900  # 15 minutos
                done
            ) &
            echo $! > /tmp/wall_refresh.pid
            ;;
        *)
            random_img=$(pick_random_wall "$HOME/.config/bspwm/rices/$RICE/walls")
            feh --bg-fill "$random_img"
            WallSync &
            ;;
    esac
