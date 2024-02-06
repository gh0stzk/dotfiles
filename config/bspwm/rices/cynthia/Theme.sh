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
# Color scheme for Cynthia Rice

# Default colors
[colors.primary]
background = "#1f2329"
foreground = "#b8bfe5"

# Cursor colors
[colors.cursor]
cursor = "#465b80"
text = "#e5e5e5"

# Normal colors
[colors.normal]
black = "#0f1319"
blue = "#3f5273"
cyan = "#324f66"
green = "#375759"
magenta = "#543f66"
red = "#644d66"
white = "#b3b3b3"
yellow = "#736871"

# Bright colors
[colors.bright]
black = "#b3b3b3"
blue = "#465b80"
cyan = "#385a73"
green = "#3f6566"
magenta = "#533969"
red = "#735771"
white = "#e5e5e5"
yellow = "#807476"
EOF
}

# Set compositor configuration
set_picom_config() {
    sed -i "$HOME"/.config/bspwm/picom.conf \
        -e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
        -e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
        -e "s/corner-radius = .*/corner-radius = 6/g" \
        -e "s/\".*:class_g = 'Alacritty'\"/\"98:class_g = 'Alacritty'\"/g" \
        -e "s/\".*:class_g = 'FloaTerm'\"/\"98:class_g = 'FloaTerm'\"/g"
}

# Set stalonetray config
set_stalonetray_config() {
    sed -i "$HOME"/.config/bspwm/stalonetrayrc \
        -e "s/background .*/background \"#0B0910\"/" \
        -e "s/vertical .*/vertical true/" \
        -e "s/geometry .*/geometry 1x1-415+45/" \
        -e "s/grow_gravity .*/grow_gravity NE/" \
        -e "s/icon_gravity .*/icon_gravity NE/"
}

# Set dunst notification daemon config
set_dunst_config() {
    sed -i "$HOME"/.config/bspwm/dunstrc \
        -e "s/transparency = .*/transparency = 4/g" \
        -e "s/frame_color = .*/frame_color = \"#1f2329\"/g" \
        -e "s/separator_color = .*/separator_color = \"#3f5273\"/g" \
        -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
        -e "s/foreground='.*'/foreground='#3f5273'/g"

    sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
    cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#1f2329"
			foreground = "#b3b3b3"

			[urgency_normal]
			timeout = 6
			background = "#1f2329"
			foreground = "#b3b3b3"

			[urgency_critical]
			timeout = 0
			background = "#1f2329"
			foreground = "#b3b3b3"
_EOF_
}

# Set eww colors
set_eww_colors() {
    cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Cynthia rice
\$bg: #1f2329;
\$bg-alt: #23272e;
\$fg: #b8bfe5;
\$black: #b3b3b3;
\$lightblack: #262831;
\$red: #735771;
\$blue: #465b80;
\$cyan: #385a73;
\$magenta: #533969;
\$green: #3f6566;
\$yellow: #807476;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Cynthia
set_jgmenu_colors() {
    sed -i "$HOME"/.config/bspwm/jgmenurc \
        -e 's/color_menu_bg = .*/color_menu_bg = #1f2329/' \
        -e 's/color_norm_fg = .*/color_norm_fg = #b8bfe5/' \
        -e 's/color_sel_bg = .*/color_sel_bg = #23272e/' \
        -e 's/color_sel_fg = .*/color_sel_fg = #b8bfe5/' \
        -e 's/color_sep_fg = .*/color_sep_fg = #b3b3b3/'
}

# Set Rofi launcher config
set_launcher_config () {
    sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
        -e '22s/\(font: \).*/\1"Terminess Nerd Font Mono Bold 10";/' \
        -e 's/\(background: \).*/\1#1f2329;/' \
        -e 's/\(background-alt: \).*/\1#1f2329E0;/' \
        -e 's/\(foreground: \).*/\1#b8bfe5;/' \
        -e 's/\(selected: \).*/\1#3f5273;/' \
        -e 's/[^/]*-rofi/cy-rofi/'

    # WallSelect menu colors
    sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
        -e 's/\(main-bg: \).*/\1#1f2329E6;/' \
        -e 's/\(main-fg: \).*/\1#b8bfe5;/' \
        -e 's/\(select-bg: \).*/\1#3f5273;/' \
        -e 's/\(select-fg: \).*/\1#1f2329;/'
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
set_stalonetray_config
launch_bars
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
