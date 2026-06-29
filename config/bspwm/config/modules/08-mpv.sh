#!/bin/sh

target="$HOME/.config/mpv/script-opts/modernz.conf"

{
    sed '/^# Colors and style$/,$d' "$target"
    cat <<EOF
# Colors and style
# accent color of the OSC and title bar
osc_color=${bg}
# color of the title in borderless/fullscreen mode
window_title_color=${fg}
# color of the window controls (close, minimize, maximize) in borderless/fullscreen mode
window_controls_color=${fg}
# color of close window control on hover
windowcontrols_close_hover=${red}
# color of maximize window controls on hover
windowcontrols_max_hover=${yellow}
# color of minimize window controls on hover
windowcontrols_min_hover=${magenta}
# color of the title
title_color=${fg}
# color of the cache information
cache_info_color=${fg}
# color of the cache ranges on the seekbar
seekbar_cache_color=${bg}
# color of the seekbar progress
seekbarfg_color=${magenta}
# color of the remaining seekbar
seekbarbg_color=${accent_color}
# color of the seekbar handle
seek_handle_color=${bg}
# inner border color drawn inside the seekbar handle (set to disable to disable)
seek_handle_border_color=${yellow}
# match volume bar color with seekbar color (ignores side_buttons_color)
volumebar_match_seek_color=yes
# color of the timestamps (below seekbar)
time_color=${fg}
# color of the chapter title
chapter_title_color=${fg}
# color of the side buttons (audio, subtitles, playlist, etc.)
side_buttons_color=${fg}
# color of the middle buttons (skip, jump, chapter, etc.)
middle_buttons_color=${fg}
# color of the play/pause button
playpause_color=${fg}
# color of the element when held down (pressed)
held_element_color=${accent_color}
# color of a hovered button when hover_effect includes "color"
hover_effect_color=${green}
# color of the background for thumbnail box
thumbnail_box_color=${bg}
# color of the border outline for thumbnail box
thumbnail_box_outline=${yellow}
# color of chapter nibbles on the seekbar
nibble_color=#FF0000
# color of the current chapter nibble on the seekbar
nibble_current_color=#FFFFFF
# color of the A/B loop range on the seekbar
ab_loop_color=#2596be
EOF
} | _write "$target"
