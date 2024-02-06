#!/usr/bin/env bash
#   █████╗ ██╗     ██╗███╗   ██╗███████╗    ██████╗ ██╗ ██████╗███████╗
#  ██╔══██╗██║     ██║████╗  ██║██╔════╝    ██╔══██╗██║██╔════╝██╔════╝
#  ███████║██║     ██║██╔██╗ ██║█████╗      ██████╔╝██║██║     █████╗
#  ██╔══██║██║     ██║██║╚██╗██║██╔══╝      ██╔══██╗██║██║     ██╔══╝
#  ██║  ██║███████╗██║██║ ╚████║███████╗    ██║  ██║██║╚██████╗███████╗
#  ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Aline
set_bspwm_config() {
    bspc config border_width 0
    bspc config top_padding 57
    bspc config bottom_padding 2
    bspc config left_padding 2
    bspc config right_padding 2
    bspc config normal_border_color "#ca9ee6"
    bspc config active_border_color "#ca9ee6"
    bspc config focused_border_color "#8CAAEE"
    bspc config presel_feedback_color "#E78284"
}

# Reload terminal colors
set_term_config() {
    cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Pencil light) color scheme for Aline Rice

# Default colors
[colors.primary]
background = "#e5eafe"
foreground = "#51576d"

# Cursor colors
[colors.cursor]
cursor = "#20bbfc"
text = "#e5eafe"

# Normal colors
[colors.normal]
black = "#212121"
blue = "#008ec4"
cyan = "#20a5ba"
green = "#10a778"
magenta = "#523c79"
red = "#c30771"
white = "#51576d"
yellow = "#a89c14"

# Bright colors
[colors.bright]
black = "#212121"
blue = "#20bbfc"
cyan = "#4fb8cc"
green = "#5fd7af"
magenta = "#6855de"
red = "#fb007a"
white = "#51576d"
yellow = "#f3e430"
EOF
}

# Set compositor configuration
set_picom_config() {
    sed -i "$HOME"/.config/bspwm/picom.conf \
        -e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
        -e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
        -e "s/corner-radius = .*/corner-radius = 6/g" \
        -e "s/\".*:class_g = 'Alacritty'\"/\"95:class_g = 'Alacritty'\"/g" \
        -e "s/\".*:class_g = 'FloaTerm'\"/\"95:class_g = 'FloaTerm'\"/g"
}

# Set stalonetray config
set_stalonetray_config() {
    sed -i "$HOME"/.config/bspwm/stalonetrayrc \
        -e "s/background .*/background \"#F4F5F8\"/" \
        -e "s/vertical .*/vertical true/" \
        -e "s/geometry .*/geometry 1x1-160+50/" \
        -e "s/grow_gravity .*/grow_gravity NE/" \
        -e "s/icon_gravity .*/icon_gravity NE/"
}

# Set dunst notification daemon config
set_dunst_config() {
    sed -i "$HOME"/.config/bspwm/dunstrc \
        -e "s/transparency = .*/transparency = 3/g" \
        -e "s/frame_color = .*/frame_color = \"#e5eafe\"/g" \
        -e "s/separator_color = .*/separator_color = \"#fb007a\"/g" \
        -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
        -e "s/foreground='.*'/foreground='#20bbfc'/g"

    sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
    cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#e5eafe"
			foreground = "#51576d"

			[urgency_normal]
			timeout = 6
			background = "#e5eafe"
			foreground = "#51576d"

			[urgency_critical]
			timeout = 0
			background = "#e5eafe"
			foreground = "#51576d"
_EOF_
}

# Set eww colors
set_eww_colors() {
    cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Aline rice
\$bg: #f4f5f8;
\$bg-alt: #e5eafe;
\$fg: #51576d;
\$black: #212121;
\$lightblack: #262831;
\$red: #c30771;
\$blue: #008ec4;
\$cyan: #20a5ba;
\$magenta: #523c79;
\$green: #10a778;
\$yellow: #a89c14;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Aline
set_jgmenu_colors() {
    sed -i "$HOME"/.config/bspwm/jgmenurc \
        -e 's/color_menu_bg = .*/color_menu_bg = #f4f5f8/' \
        -e 's/color_norm_fg = .*/color_norm_fg = #51576d/' \
        -e 's/color_sel_bg = .*/color_sel_bg = #e5eafe/' \
        -e 's/color_sel_fg = .*/color_sel_fg = #51576d/' \
        -e 's/color_sep_fg = .*/color_sep_fg = #212121/'
}

# Set Rofi launcher config
set_launcher_config () {
    sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
        -e '22s/\(font: \).*/\1"JetBrainsMono NF Bold 9";/' \
        -e 's/\(background: \).*/\1#f4f5f8;/' \
        -e 's/\(background-alt: \).*/\1#f4f5f8E0;/' \
        -e 's/\(foreground: \).*/\1#49495a;/' \
        -e 's/\(selected: \).*/\1#ee6388;/' \
        -e 's/[^/]*-rofi/al-rofi/'

    # WallSelect menu colors
    sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
        -e 's/\(main-bg: \).*/\1#f4f5f8E6;/' \
        -e 's/\(main-fg: \).*/\1#49495a;/' \
        -e 's/\(select-bg: \).*/\1#ee6388;/' \
        -e 's/\(select-fg: \).*/\1#f4f5f8;/'
}

# Launch the bar
launch_bars() {

    for mon in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$mon polybar -q aline-bar -c "${rice_dir}"/config.ini &
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
