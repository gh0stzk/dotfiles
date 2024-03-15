#!/usr/bin/env bash
#   ██████╗██╗   ██╗███╗   ██╗████████╗██╗  ██╗██╗ █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔════╝╚██╗ ██╔╝████╗  ██║╚══██╔══╝██║  ██║██║██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ██║      ╚████╔╝ ██╔██╗ ██║   ██║   ███████║██║███████║    ██████╔╝██║██║     █████╗
#  ██║       ╚██╔╝  ██║╚██╗██║   ██║   ██╔══██║██║██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ╚██████╗   ██║   ██║ ╚████║   ██║   ██║  ██║██║██║  ██║    ██║  ██║██║╚██████╗███████╗
#   ╚═════╝   ╚═╝   ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Cynthia
set_bspwm_config() {
    bspc config border_width 0
    bspc config top_padding 48
    bspc config bottom_padding 48
    bspc config left_padding 2
    bspc config right_padding 2
    bspc config normal_border_color "#543f66"
    bspc config active_border_color "#543f66"
    bspc config focused_border_color "#465b80"
    bspc config presel_feedback_color "#3f5273"
}

# Reload terminal colors
set_term_config() {
    cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Kanagawa Dragon) Color scheme for Cynthia Rice

# Default colors
[colors.primary]
background = '#181616'
foreground = '#c5c9c5'

# Cursor colors
[colors.cursor]
cursor = "#8a9a7b"
text = "#181616"

# Normal colors
[colors.normal]
black = '#0d0c0c'
blue = '#8ba4b0'
cyan = '#8ea4a2'
green = '#8a9a7b'
magenta = '#a292a3'
red = '#c4746e'
white = '#C8C093'
yellow = '#c4b28a'

# Bright colors
[colors.bright]
black = '#a6a69c'
blue = '#7FB4CA'
cyan = '#7AA89F'
green = '#87a987'
magenta = '#938AA9'
red = '#E46876'
white = '#c5c9c5'
yellow = '#E6C384'
EOF
}

# Set compositor configuration
set_picom_config() {
    sed -i "$HOME"/.config/bspwm/picom.conf \
        -e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
        -e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
        -e "s/corner-radius = .*/corner-radius = 6/g" \
        -e "s/\".*:class_g = 'Alacritty'\"/\"99:class_g = 'Alacritty'\"/g" \
        -e "s/\".*:class_g = 'FloaTerm'\"/\"99:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
    sed -i "$HOME"/.config/bspwm/dunstrc \
        -e "s/transparency = .*/transparency = 4/g" \
        -e "s/frame_color = .*/frame_color = \"#181616\"/g" \
        -e "s/separator_color = .*/separator_color = \"#c5c9c5\"/g" \
        -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
        -e "s/foreground='.*'/foreground='#c5c9c5'/g"

    sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
    cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#181616"
			foreground = "#c5c9c5"

			[urgency_normal]
			timeout = 6
			background = "#181616"
			foreground = "#c5c9c5"

			[urgency_critical]
			timeout = 0
			background = "#181616"
			foreground = "#c5c9c5"
_EOF_
}

# Set eww colors
set_eww_colors() {
    cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Cynthia rice
\$bg: #181616;
\$bg-alt: #1c1a1a;
\$fg: #c5c9c5;
\$black: #a6a69c;
\$lightblack: #262831;
\$red: #c4746e;
\$blue: #8ba4b0;
\$cyan: #8ea4a2;
\$magenta: #a292a3;
\$green: #8a9a7b;
\$yellow: #c4b28a;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Cynthia
set_jgmenu_colors() {
    sed -i "$HOME"/.config/bspwm/jgmenurc \
        -e 's/color_menu_bg = .*/color_menu_bg = #181616/' \
        -e 's/color_norm_fg = .*/color_norm_fg = #c5c9c5/' \
        -e 's/color_sel_bg = .*/color_sel_bg = #8a9a7b/' \
        -e 's/color_sel_fg = .*/color_sel_fg = #181616/' \
        -e 's/color_sep_fg = .*/color_sep_fg = #8a9a7b/'
}

# Set Rofi launcher config
set_launcher_config () {
    sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
        -e '22s/\(font: \).*/\1"Terminess Nerd Font Mono Bold 10";/' \
        -e 's/\(background: \).*/\1#181616;/' \
        -e 's/\(background-alt: \).*/\1#181616E0;/' \
        -e 's/\(foreground: \).*/\1#c5c9c5;/' \
        -e 's/\(selected: \).*/\1#8ba4b0;/' \
        -e "s/rices\/[[:alnum:]\-]*/rices\/${RICETHEME}/g"

    # WallSelect menu colors
    sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
        -e 's/\(main-bg: \).*/\1#181616E6;/' \
        -e 's/\(main-fg: \).*/\1#c5c9c5;/' \
        -e 's/\(select-bg: \).*/\1#8ea4a2;/' \
        -e 's/\(select-fg: \).*/\1#181616;/'
}

# Launch the bar
launch_bars() {

    for mon in $(polybar --list-monitors | cut -d":" -f1); do
        (MONITOR=$mon polybar -q cyn-bar -c "${rice_dir}"/config.ini)&
        (MONITOR=$mon polybar -q cyn-bar2 -c "${rice_dir}"/config.ini)&
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
