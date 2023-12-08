#!/usr/bin/env bash
#  ███╗   ███╗███████╗██╗     ██╗███████╗███████╗ █████╗     ██████╗ ██╗ ██████╗███████╗
#  ████╗ ████║██╔════╝██║     ██║██╔════╝██╔════╝██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ██╔████╔██║█████╗  ██║     ██║███████╗███████╗███████║    ██████╔╝██║██║     █████╗
#  ██║╚██╔╝██║██╔══╝  ██║     ██║╚════██║╚════██║██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ██║ ╚═╝ ██║███████╗███████╗██║███████║███████║██║  ██║    ██║  ██║██║╚██████╗███████╗
#  ╚═╝     ╚═╝╚══════╝╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Melissa
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 42
	bspc config bottom_padding 40
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#e5e9f0"
	bspc config active_border_color "#e5e9f0"
	bspc config focused_border_color "#4c566a"
	bspc config presel_feedback_color "#bf616a"
}

# Reload terminal colors
set_term_config() {
	sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono NF/g" \
		-e "s/size: .*/size: 10/g"
		
	sed -i "$HOME"/.config/alacritty/rice-colors.yml \
		-e "s/colors: .*/colors: *melissa_nord/"
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
		-e "s/background .*/background \"#4C566A\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-1187+838/" \
		-e "s/grow_gravity .*/grow_gravity SE/" \
		-e "s/icon_gravity .*/icon_gravity SE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 4/g" \
		-e "s/frame_color = .*/frame_color = \"#2e3440\"/g" \
		-e "s/separator_color = .*/separator_color = \"#a3be8c\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#81a1c1'/g"
		
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#2e3440"
			foreground = "#d8dee9"

			[urgency_normal]
			timeout = 6
			background = "#2e3440"
			foreground = "#d8dee9"

			[urgency_critical]
			timeout = 0
			background = "#2e3440"
			foreground = "#d8dee9"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Melissa rice
\$bg: #2e3440;
\$bg-alt: #353C4A;
\$fg: #d8dee9;
\$black: #4c566a;
\$lightblack: #262831;
\$red: #bf616a;
\$blue: #81a1c1;
\$cyan: #88c0d0;
\$magenta: #b48ead;
\$green: #a3be8c;
\$yellow: #ebcb8b;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Melissa
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #2e3440/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #d8dee9/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #353C4A/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #d8dee9/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #4c566a/'
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e '22s/\(font: \).*/\1"Terminess Nerd Font Mono Bold 10";/' \
		-e 's/\(background: \).*/\1#2e3440;/' \
		-e 's/\(background-alt: \).*/\1#2e3440E0;/' \
		-e 's/\(foreground: \).*/\1#e5e9f0;/' \
		-e 's/\(selected: \).*/\1#88c0d0;/' \
		-e 's/[^/]*-rofi/me-rofi/'
		
	# WallSelect menu colors	
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#2e3440E6;/' \
		-e 's/\(main-fg: \).*/\1#e5e9f0;/' \
		-e 's/\(select-bg: \).*/\1#88c0d0;/' \
		-e 's/\(select-fg: \).*/\1#2e3440;/'
}

# Launch the bar
launch_bars() {
	
	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		(MONITOR=$mon polybar -q mel-bar -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q mel2-bar -c ${rice_dir}/config.ini)&
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
