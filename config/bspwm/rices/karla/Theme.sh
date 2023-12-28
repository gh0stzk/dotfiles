#!/usr/bin/env bash
#  ██╗  ██╗ █████╗ ██████╗ ██╗      █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██║ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  █████╔╝ ███████║██████╔╝██║     ███████║    ██████╔╝██║██║     █████╗
#  ██╔═██╗ ██╔══██║██╔══██╗██║     ██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ██║  ██╗██║  ██║██║  ██║███████╗██║  ██║    ██║  ██║██║╚██████╗███████╗
#  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Karla
set_bspwm_config() {
	bspc config border_width 3
	bspc config top_padding 48
	bspc config bottom_padding 2
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#21222c"
	bspc config active_border_color "#353c52"
	bspc config focused_border_color "#353c52"
	bspc config presel_feedback_color "#8656e3"
}

# Reload terminal colors
set_term_config() {
	cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Zombie-Night) Color scheme for Karla Rice

# Default colors
[colors.primary]
background = "#0E1113"
foreground = "#afb1db"

# Cursor colors
[colors.cursor]
cursor = "#8656e3"
text = "#0b0b12"

# Normal colors
[colors.normal]
black = "#2d2b36"
blue = "#5884d4"
cyan = "#7df0f0"
green = "#61b33e"
magenta = "#7a44e3"
red = "#e7034a"
white = "#faf7ff"
yellow = "#ffb964"

# Bright colors
[colors.bright]
black = "#373542"
blue = "#5f90ea"
cyan = "#97f0f0"
green = "#6fb352"
magenta = "#8656e3"
red = "#e71c5b"
white = "#fdfcff"
yellow = "#ffb964"
EOF
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = false; shadow = false; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/corner-radius = .*/corner-radius = 0/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"95:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"95:class_g = 'FloaTerm'\"/g"
}

# Set stalonetray config
set_stalonetray_config() {
	sed -i "$HOME"/.config/bspwm/stalonetrayrc \
		-e "s/background .*/background \"#0E1113\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-50+46/" \
		-e "s/grow_gravity .*/grow_gravity NE/" \
		-e "s/icon_gravity .*/icon_gravity NE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 8/g" \
		-e "s/frame_color = .*/frame_color = \"#0E1113\"/g" \
		-e "s/separator_color = .*/separator_color = \"#353c52\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#7a44e3'/g"
		
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#0E1113"
			foreground = "#afb1db"

			[urgency_normal]
			timeout = 6
			background = "#0E1113"
			foreground = "#afb1db"

			[urgency_critical]
			timeout = 0
			background = "#0E1113"
			foreground = "#afb1db"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Karla rice
\$bg: #0E1113;
\$bg-alt: #111517;
\$fg: #afb1db;
\$black: #373542;
\$lightblack: #262831;
\$red: #e7034a;
\$blue: #5884d4;
\$cyan: #7df0f0;
\$magenta: #7a44e3;
\$green: #61b33e;
\$yellow: #ffb964;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Karla
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #0E1113/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #afb1db/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #111517/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #afb1db/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #373542/'
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e '22s/\(font: \).*/\1"JetBrainsMono NF Bold 9";/' \
		-e 's/\(background: \).*/\1#0E1113F7;/' \
		-e 's/\(background-alt: \).*/\1#0E1113F5;/' \
		-e 's/\(foreground: \).*/\1#afb1db;/' \
		-e 's/\(selected: \).*/\1#3d7fea;/' \
		-e 's/[^/]*-rofi/ka-rofi/'
		
	# WallSelect menu colors	
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#0E1113F7;/' \
		-e 's/\(main-fg: \).*/\1#afb1db;/' \
		-e 's/\(select-bg: \).*/\1#3d7fea;/' \
		-e 's/\(select-fg: \).*/\1#0E1113;/'
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		(MONITOR=$mon polybar -q karla-bar -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q karla-bar2 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q karla-bar3 -c ${rice_dir}/config.ini)&
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
