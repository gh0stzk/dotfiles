#!/usr/bin/env bash
#  ██████╗  █████╗ ███╗   ██╗██╗███████╗██╗      █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔══██╗██╔══██╗████╗  ██║██║██╔════╝██║     ██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ██║  ██║███████║██╔██╗ ██║██║█████╗  ██║     ███████║    ██████╔╝██║██║     █████╗  
#  ██║  ██║██╔══██║██║╚██╗██║██║██╔══╝  ██║     ██╔══██║    ██╔══██╗██║██║     ██╔══╝  
#  ██████╔╝██║  ██║██║ ╚████║██║███████╗███████╗██║  ██║    ██║  ██║██║╚██████╗███████╗
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Emilia
set_bspwm_config() {
    bspc config border_width 0
    bspc config top_padding 47
    bspc config bottom_padding 2
    bspc config left_padding 2
    bspc config right_padding 2
    bspc config normal_border_color "#414868"
    bspc config active_border_color "#c0caf5"
    bspc config focused_border_color "#bb9af7"
    bspc config presel_feedback_color "#7aa2f7"
}

# Reload terminal colors
set_term_config() {
    cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Catppuccin Mocha) color scheme for Daniela Rice

# Default colors
[colors.primary]
background = "#181825"
foreground = "#CDD6F4"

# Cursor colors
[colors.cursor]
text = "#181825"
cursor = "#F5E0DC"

[colors.selection]
text = "#181825"
background = "#F5E0DC"

# Normal colors
[colors.normal]
black = "#45475A"
red = "#F38BA8"
green = "#A6E3A1"
yellow = "#F9E2AF"
blue = "#89B4FA"
magenta = "#F5C2E7"
cyan = "#94E2D5"
white = "#BAC2DE"

# Bright colors
[colors.bright]
black = "#585B70"
red = "#F38BA8"
green = "#A6E3A1"
yellow = "#F9E2AF"
blue = "#89B4FA"
magenta = "#F5C2E7"
cyan = "#94E2D5"
white = "#A6ADC8"
EOF
}

# Set compositor configuration
set_picom_config() {
    sed -i "$HOME"/.config/bspwm/picom.conf \
        -e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
        -e "s/shadow-color = .*/shadow-color = \"#181825\"/g" \
        -e "s/corner-radius = .*/corner-radius = 6/g" \
        -e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
        -e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
    sed -i "$HOME"/.config/bspwm/dunstrc \
        -e "s/transparency = .*/transparency = 0/g" \
        -e "s/frame_color = .*/frame_color = \"#181825\"/g" \
        -e "s/separator_color = .*/separator_color = \"#CDD6F4\"/g" \
        -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
        -e "s/foreground='.*'/foreground='#F5C2E7'/g"

    sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
    cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#181825"
			foreground = "#CDD6F4"

			[urgency_normal]
			timeout = 6
			background = "#181825"
			foreground = "#CDD6F4"

			[urgency_critical]
			timeout = 0
			background = "#181825"
			foreground = "#CDD6F4"
_EOF_
}

# Set eww colors
set_eww_colors() {
    cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Daniela rice
\$bg: #181825;
\$bg-alt: #1e1e2e;
\$fg: #CDD6F4;
\$black: #45475A;
\$lightblack: #262831;
\$red: #F38BA8;
\$blue: #89B4FA;
\$cyan: #94E2D5;
\$magenta: #F5C2E7;
\$green: #A6E3A1;
\$yellow: #F9E2AF;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Daniela
set_jgmenu_colors() {
    sed -i "$HOME"/.config/bspwm/jgmenurc \
        -e 's/color_menu_bg = .*/color_menu_bg = #181825/' \
        -e 's/color_norm_fg = .*/color_norm_fg = #CDD6F4/' \
        -e 's/color_sel_bg = .*/color_sel_bg = #1e1e2e/' \
        -e 's/color_sel_fg = .*/color_sel_fg = #CDD6F4/' \
        -e 's/color_sep_fg = .*/color_sep_fg = #45475A/'
}

# Set Rofi launcher config
set_launcher_config () {
    sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
        -e '22s/\(font: \).*/\1"JetBrainsMono NF Bold 9";/' \
        -e 's/\(background: \).*/\1#181825;/' \
        -e 's/\(background-alt: \).*/\1#181825E0;/' \
        -e 's/\(foreground: \).*/\1#CDD6F4;/' \
        -e 's/\(selected: \).*/\1#F5C2E7;/' \
        -e "s/rices\/[[:alnum:]\-]*/rices\/${RICETHEME}/g"

    # WallSelect menu colors
    sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
        -e 's/\(main-bg: \).*/\1#181825E6;/' \
        -e 's/\(main-fg: \).*/\1#CDD6F4;/' \
        -e 's/\(select-bg: \).*/\1#F5C2E7;/' \
        -e 's/\(select-fg: \).*/\1#181825;/'
}

# Launch the bar
launch_bars() {

    for mon in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$mon polybar -q dani -c "${rice_dir}"/config.ini &
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
