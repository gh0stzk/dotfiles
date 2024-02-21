#!/usr/bin/env bash
#   ██████╗██████╗ ██╗███████╗████████╗██╗███╗   ██╗ █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔════╝██╔══██╗██║██╔════╝╚══██╔══╝██║████╗  ██║██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ██║     ██████╔╝██║███████╗   ██║   ██║██╔██╗ ██║███████║    ██████╔╝██║██║     █████╗
#  ██║     ██╔══██╗██║╚════██║   ██║   ██║██║╚██╗██║██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ╚██████╗██║  ██║██║███████║   ██║   ██║██║ ╚████║██║  ██║    ██║  ██║██║╚██████╗███████╗
#   ╚═════╝╚═╝  ╚═╝╚═╝╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Cristina
set_bspwm_config() {
    bspc config border_width 0
    bspc config top_padding 2
    bspc config bottom_padding 60
    bspc config left_padding 2
    bspc config right_padding 2
    bspc config normal_border_color "#9bced7"
    bspc config active_border_color "#9bced7"
    bspc config focused_border_color "#c3a5e6"
    bspc config presel_feedback_color "#c3a5e6"
}

# Reload terminal colors
set_term_config() {
    cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Rose-Pine Moon) Color scheme for Cristina Rice

# Default colors
[colors.primary]
background = "#1f1d29"
foreground = "#eaeaea"

# Cursor colors
[colors.cursor]
cursor = "#c3a5e6"
text = "#1f1d29"

# Normal colors
[colors.normal]
black = "#6f6e85"
blue = "#34738e"
cyan = "#eabbb9"
green = "#9bced7"
magenta = "#c3a5e6"
red = "#ea6f91"
white = "#faebd7"
yellow = "#f1ca93"

# Bright colors
[colors.bright]
black = "#6f6e85"
blue = "#34738e"
cyan = "#ebbcba"
green = "#9bced7"
magenta = "#c3a5e6"
red = "#ea6f91"
white = "#e0def4"
yellow = "#f1ca93"
EOF
}

# Set compositor configuration
set_picom_config() {
    sed -i "$HOME"/.config/bspwm/picom.conf \
        -e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
        -e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
        -e "s/corner-radius = .*/corner-radius = 6/g" \
        -e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
        -e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
    sed -i "$HOME"/.config/bspwm/dunstrc \
        -e "s/transparency = .*/transparency = 0/g" \
        -e "s/frame_color = .*/frame_color = \"#1f1d29\"/g" \
        -e "s/separator_color = .*/separator_color = \"#ea6f91\"/g" \
        -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
        -e "s/foreground='.*'/foreground='#9bced7'/g"

    sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
    cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#1f1d29"
			foreground = "#eaeaea"

			[urgency_normal]
			timeout = 6
			background = "#1f1d29"
			foreground = "#eaeaea"

			[urgency_critical]
			timeout = 0
			background = "#1f1d29"
			foreground = "#eaeaea"
_EOF_
}

# Set eww colors
set_eww_colors() {
    cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Cristina rice
\$bg: #1f1d29;
\$bg-alt: #272433;
\$fg: #eaeaea;
\$black: #6f6e85;
\$lightblack: #262831;
\$red: #ea6f91;
\$blue: #34738e;
\$cyan: #eabbb9;
\$magenta: #c3a5e6;
\$green: #9bced7;
\$yellow: #f1ca93;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Cristina
set_jgmenu_colors() {
    sed -i "$HOME"/.config/bspwm/jgmenurc \
        -e 's/color_menu_bg = .*/color_menu_bg = #1f1d29/' \
        -e 's/color_norm_fg = .*/color_norm_fg = #eaeaea/' \
        -e 's/color_sel_bg = .*/color_sel_bg = #272433/' \
        -e 's/color_sel_fg = .*/color_sel_fg = #eaeaea/' \
        -e 's/color_sep_fg = .*/color_sep_fg = #6f6e85/'
}

# Set Rofi launcher config
set_launcher_config () {
    sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
        -e '22s/\(font: \).*/\1"Terminess Nerd Font Mono Bold 10";/' \
        -e 's/\(background: \).*/\1#1f1d29;/' \
        -e 's/\(background-alt: \).*/\1#1f1d29E0;/' \
        -e 's/\(foreground: \).*/\1#eaeaea;/' \
        -e 's/\(selected: \).*/\1#c3a5e6;/' \
        -e 's/[^/]*-rofi/cr-rofi/'

    # WallSelect menu colors
    sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
        -e 's/\(main-bg: \).*/\1#1f1d29E6;/' \
        -e 's/\(main-fg: \).*/\1#eaeaea;/' \
        -e 's/\(select-bg: \).*/\1#c3a5e6;/' \
        -e 's/\(select-fg: \).*/\1#1f1d29;/'
}

# Launch the bar and or eww widgets
launch_bars() {

    for mon in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$mon polybar -q cristina-bar -c "${rice_dir}"/config.ini &
    done

}



### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
launch_bars
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
