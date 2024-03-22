#!/usr/bin/env bash
#  ███╗   ███╗ █████╗ ██████╗ ██╗███████╗ ██████╗ ██╗         ██████╗ ██╗ ██████╗███████╗
#  ████╗ ████║██╔══██╗██╔══██╗██║██╔════╝██╔═══██╗██║         ██╔══██╗██║██╔════╝██╔════╝
#  ██╔████╔██║███████║██████╔╝██║███████╗██║   ██║██║         ██████╔╝██║██║     █████╗
#  ██║╚██╔╝██║██╔══██║██╔══██╗██║╚════██║██║   ██║██║         ██╔══██╗██║██║     ██╔══╝
#  ██║ ╚═╝ ██║██║  ██║██║  ██║██║███████║╚██████╔╝███████╗    ██║  ██║██║╚██████╗███████╗
#  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Marisol
set_bspwm_config() {
    bspc config border_width 2
    bspc config top_padding 45
    bspc config bottom_padding 2
    bspc config left_padding 2
    bspc config right_padding 2
    bspc config normal_border_color "#ff92df"
    bspc config active_border_color "#c0caf5"
    bspc config focused_border_color "#bd93f9"
    bspc config presel_feedback_color "#50fa7b"
}

# Reload terminal colors
set_term_config() {
    cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Dracula) color scheme for Marisol Rice

# Default colors
[colors.primary]
background = "#282a36"
foreground = "#f8f8f2"

# Cursor colors
[colors.cursor]
cursor = "#f8f8f2"
text = "#282a36"

# Normal colors
[colors.normal]
black = "#21222c"
blue = "#bd93f9"
cyan = "#8be9fd"
green = "#50fa7b"
magenta = "#ff79c6"
red = "#ff5555"
white = "#f8f8f2"
yellow = "#f1fa8c"

# Bright colors
[colors.bright]
black = "#6272a4"
blue = "#d6acff"
cyan = "#a4ffff"
green = "#69ff94"
magenta = "#ff92df"
red = "#ff6e6e"
white = "#ffffff"
yellow = "#ffffa5"
EOF
}

# Set compositor configuration
set_picom_config() {
    sed -i "$HOME"/.config/bspwm/picom.conf \
        -e "s/normal = .*/normal =  { fade = true; shadow = false; }/g" \
        -e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
        -e "s/corner-radius = .*/corner-radius = 0/g" \
        -e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
        -e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
    sed -i "$HOME"/.config/bspwm/dunstrc \
        -e "s/transparency = .*/transparency = 0/g" \
        -e "s/frame_color = .*/frame_color = \"#282a36\"/g" \
        -e "s/separator_color = .*/separator_color = \"#a4ffff\"/g" \
        -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
        -e "s/foreground='.*'/foreground='#a4ffff'/g"

    sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
    cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#282a36"
			foreground = "#f8f8f2"

			[urgency_normal]
			timeout = 6
			background = "#282a36"
			foreground = "#f8f8f2"

			[urgency_critical]
			timeout = 0
			background = "#282a36"
			foreground = "#f8f8f2"
_EOF_
}

# Set eww colors
set_eww_colors() {
    cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Marisol rice
\$bg: #282a36;
\$bg-alt: #2f3240;
\$fg: #f8f8f2;
\$black: #21222c;
\$lightblack: #727169;
\$red: #ff5555;
\$blue: #bd93f9;
\$cyan: #8be9fd;
\$magenta: #ff79c6;
\$green: #50fa7b;
\$yellow: #f1fa8c;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Marisol
set_jgmenu_colors() {
    sed -i "$HOME"/.config/bspwm/jgmenurc \
        -e 's/color_menu_bg = .*/color_menu_bg = #282a36/' \
        -e 's/color_norm_fg = .*/color_norm_fg = #f8f8f2/' \
        -e 's/color_sel_bg = .*/color_sel_bg = #4c566a/' \
        -e 's/color_sel_fg = .*/color_sel_fg = #f8f8f2/' \
        -e 's/color_sep_fg = .*/color_sep_fg = #bd93f9/'
}

# Set Rofi launcher config
set_launcher_config () {
    sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
        -e '22s/\(font: \).*/\1"JetBrainsMono NF Bold 9";/' \
        -e 's/\(background: \).*/\1#282a36;/' \
        -e 's/\(background-alt: \).*/\1#282a36E0;/' \
        -e 's/\(foreground: \).*/\1#f8f8f2;/' \
        -e 's/\(selected: \).*/\1#bd93f9;/' \
        -e "s/rices\/[[:alnum:]\-]*/rices\/${RICETHEME}/g"

    # WallSelect menu colors
    sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
        -e 's/\(main-bg: \).*/\1#282a36E6;/' \
        -e 's/\(main-fg: \).*/\1#f8f8f2;/' \
        -e 's/\(select-bg: \).*/\1#bd93f9;/' \
        -e 's/\(select-fg: \).*/\1#f8f8f2;/'
}

# Launch the bar
launch_bars() {

    for mon in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$mon polybar -q marisol -c "${rice_dir}"/config.ini &
    done

}



### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
launch_bars
set_eww_colors
set_jgmenu_colors
set_dunst_config
set_launcher_config
