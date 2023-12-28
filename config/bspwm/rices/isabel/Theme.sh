#!/usr/bin/env bash
#  ██╗███████╗ █████╗ ██████╗ ███████╗██╗         ██████╗ ██╗ ██████╗███████╗
#  ██║██╔════╝██╔══██╗██╔══██╗██╔════╝██║         ██╔══██╗██║██╔════╝██╔════╝
#  ██║███████╗███████║██████╔╝█████╗  ██║         ██████╔╝██║██║     █████╗
#  ██║╚════██║██╔══██║██╔══██╗██╔══╝  ██║         ██╔══██╗██║██║     ██╔══╝
#  ██║███████║██║  ██║██████╔╝███████╗███████╗    ██║  ██║██║╚██████╗███████╗
#  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Isabel
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 2
	bspc config bottom_padding 42
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#b8bfe5"
	bspc config active_border_color "#b8bfe5"
	bspc config focused_border_color "#7560d3"
	bspc config presel_feedback_color "#81ae5f"
}

# Reload terminal colors
set_term_config() {
	cat > "$HOME"/.config/alacritty/rice-colors.toml << EOF
# (Onedark) Color scheme for Isabel Rice

# Default colors
[colors.primary]
background = "#14171c"
foreground = "#b8bfe5"

# Cursor colors
[colors.cursor]
cursor = "#abb2bf"
text = "#14171c"

# Normal colors
[colors.normal]
black = "#5c6370"
blue = "#4889be"
cyan = "#49919a"
green = "#81ae5f"
magenta = "#7560d3"
red = "#be5046"
white = "#c5cddb"
yellow = "#d19a66"

# Bright colors
[colors.bright]
black = "#5c6370"
blue = "#61afef"
cyan = "#56b6c2"
green = "#98c379"
magenta = "#8677cf"
red = "#e06c75"
white = "#abb2bf"
yellow = "#e5c07b"
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

# Set stalonetray config
set_stalonetray_config() {
	sed -i "$HOME"/.config/bspwm/stalonetrayrc \
		-e "s/background .*/background \"#14171C\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-103+837/" \
		-e "s/grow_gravity .*/grow_gravity SE/" \
		-e "s/icon_gravity .*/icon_gravity SE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#14171c\"/g" \
		-e "s/separator_color = .*/separator_color = \"#abb2bf\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#7560d3'/g"
		
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#14171c"
			foreground = "#b8bfe5"

			[urgency_normal]
			timeout = 6
			background = "#14171c"
			foreground = "#b8bfe5"

			[urgency_critical]
			timeout = 0
			background = "#14171c"
			foreground = "#b8bfe5"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Isabel rice
\$bg: #14171c;
\$bg-alt: #181b21;
\$fg: #b8bfe5;
\$black: #5c6370;
\$lightblack: #262831;
\$red: #be5046;
\$blue: #4889be;
\$cyan: #49919a;
\$magenta: #7560d3;
\$green: #81ae5f;
\$yellow: #d19a66;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Isabel
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #14171c/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #b8bfe5/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #181b21/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #b8bfe5/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #5c6370/'
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e '22s/\(font: \).*/\1"Terminess Nerd Font Mono Bold 10";/' \
		-e 's/\(background: \).*/\1#14171c;/' \
		-e 's/\(background-alt: \).*/\1#14171cE0;/' \
		-e 's/\(foreground: \).*/\1#b8bfe5;/' \
		-e 's/\(selected: \).*/\1#7560d3;/' \
		-e 's/[^/]*-rofi/is-rofi/'
		
	# WallSelect menu colors	
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#14171cE6;/' \
		-e 's/\(main-fg: \).*/\1#b8bfe5;/' \
		-e 's/\(select-bg: \).*/\1#7560d3;/' \
		-e 's/\(select-fg: \).*/\1#14171c;/'
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q isa-bar -c ${rice_dir}/config.ini &
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
