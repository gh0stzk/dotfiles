#!/usr/bin/env bash
#  ███████╗██╗██╗    ██╗   ██╗██╗ █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔════╝██║██║    ██║   ██║██║██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ███████╗██║██║    ██║   ██║██║███████║    ██████╔╝██║██║     █████╗
#  ╚════██║██║██║    ╚██╗ ██╔╝██║██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ███████║██║███████╗╚████╔╝ ██║██║  ██║    ██║  ██║██║╚██████╗███████╗
#  ╚══════╝╚═╝╚══════╝ ╚═══╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Silvia
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 52
	bspc config bottom_padding 2
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#d3869b"
	bspc config active_border_color "#d3869b"
	bspc config focused_border_color "#fbf1c7"
	bspc config presel_feedback_color "#b8bb26"
}

# Reload terminal colors
set_term_config() {
	sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono NF/g" \
		-e "s/size: .*/size: 10/g"
		
	sed -i "$HOME"/.config/alacritty/rice-colors.yml \
		-e "s/colors: .*/colors: *silvia_gruvbox/"
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
		-e "s/background .*/background \"#3C3836\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-6+45/" \
		-e "s/grow_gravity .*/grow_gravity NE/" \
		-e "s/icon_gravity .*/icon_gravity NE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#282828\"/g" \
		-e "s/separator_color = .*/separator_color = \"#d3869b\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#d3869b'/g"
		
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#282828"
			foreground = "#fbf1c7"

			[urgency_normal]
			timeout = 6
			background = "#282828"
			foreground = "#fbf1c7"

			[urgency_critical]
			timeout = 0
			background = "#282828"
			foreground = "#fbf1c7"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Silvia rice
\$bg: #282828;
\$bg-alt: #2E2E2E;
\$fg: #fbf1c7;
\$black: #a89984;
\$lightblack: #262831;
\$red: #fb4934;
\$blue: #83a598;
\$cyan: #8ec07c;
\$magenta: #d3869b;
\$green: #b8bb26;
\$yellow: #fabd2f;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Silvia
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #282828/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #fbf1c7/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #2E2E2E/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #fbf1c7/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #a89984/'
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e '22s/\(font: \).*/\1"scientifica 12";/' \
		-e 's/\(background: \).*/\1#282828;/' \
		-e 's/\(background-alt: \).*/\1#282828E0;/' \
		-e 's/\(foreground: \).*/\1#fbf1c7;/' \
		-e 's/\(selected: \).*/\1#d79921;/' \
		-e 's/[^/]*-rofi/si-rofi/'
		
	# WallSelect menu colors	
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#282828E6;/' \
		-e 's/\(main-fg: \).*/\1#fbf1c7;/' \
		-e 's/\(select-bg: \).*/\1#d79921;/' \
		-e 's/\(select-fg: \).*/\1#282828;/'
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q cata-bar -c ${rice_dir}/config.ini &
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
