#!/usr/bin/env bash
#  ██████╗ ██████╗ ███████╗███╗   ██╗██████╗  █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔══██╗██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ██████╔╝██████╔╝█████╗  ██╔██╗ ██║██║  ██║███████║    ██████╔╝██║██║     █████╗  
#  ██╔══██╗██╔══██╗██╔══╝  ██║╚██╗██║██║  ██║██╔══██║    ██╔══██╗██║██║     ██╔══╝  
#  ██████╔╝██║  ██║███████╗██║ ╚████║██████╔╝██║  ██║    ██║  ██║██║╚██████╗███████╗
#  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Brenda
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 50
	bspc config bottom_padding 2
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#475258"
	bspc config active_border_color "#c0caf5"
	bspc config focused_border_color "#a7c080"
	bspc config presel_feedback_color "#e67e80"
}

# Reload terminal colors
set_term_config() {
	cat >"$HOME"/.config/alacritty/rice-colors.toml <<EOF
# (Everforest) color scheme for Brenda Rice

# Default colors
[colors.primary]
background = "#2d353b"
foreground = "#d3c6aa"

# Cursor colors
[colors.cursor]
cursor = "#d3c6aa"
text = "#2d353b"

# Normal colors
[colors.normal]
black   = "#475258"
red     = "#e67e80"
green   = "#a7c080"
yellow  = "#dbbc7f"
blue    = "#7fbbb3"
magenta = "#d699b6"
cyan    = "#83c092"
white   = "#d3c6aa"

# Bright colors
[colors.bright]
black   = "#475258"
red     = "#e67e80"
green   = "#a7c080"
yellow  = "#dbbc7f"
blue    = "#7fbbb3"
magenta = "#d699b6"
cyan    = "#83c092"
white   = "#d3c6aa"
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
		-e "s/frame_color = .*/frame_color = \"#2d353b\"/g" \
		-e "s/separator_color = .*/separator_color = \"#d3c6aa\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#7fbbb3'/g"

	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >>"$HOME"/.config/bspwm/dunstrc <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "#2d353b"
		foreground = "#d3c6aa"

		[urgency_normal]
		timeout = 6
		background = "#2d353b"
		foreground = "#d3c6aa"

		[urgency_critical]
		timeout = 0
		background = "#2d353b"
		foreground = "#d3c6aa"
	_EOF_
}

# Set eww colors
set_eww_colors() {
	cat >"$HOME"/.config/bspwm/eww/colors.scss <<EOF
// Eww colors for Brenda rice
\$bg: #2d353b;
\$bg-alt: #272e33;
\$fg: #d3c6aa;
\$black: #475258;
\$lightblack: #262831;
\$red: #e67e80;
\$blue: #7fbbb3;
\$cyan: #83c092;
\$magenta: #d699b6;
\$green: #a7c080;
\$yellow: #dbbc7f;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Brenda
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #2d353b/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #d3c6aa/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #475258/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #d3c6aa/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #a7c080/'
}

# Set Rofi launcher config
set_launcher_config() {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e '22s/\(font: \).*/\1"JetBrainsMono NF Bold 9";/' \
		-e 's/\(background: \).*/\1#2d353b;/' \
		-e 's/\(background-alt: \).*/\1#2d353bE0;/' \
		-e 's/\(foreground: \).*/\1#d3c6aa;/' \
		-e 's/\(selected: \).*/\1#475258;/' \
		-e "s/rices\/[[:alnum:]\-]*/rices\/${RICETHEME}/g"

	# WallSelect menu colors
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#2d353bE6;/' \
		-e 's/\(main-fg: \).*/\1#d3c6aa;/' \
		-e 's/\(select-bg: \).*/\1#475258;/' \
		-e 's/\(select-fg: \).*/\1#2d353b;/'
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q brenda -c "${rice_dir}"/config.ini &
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
