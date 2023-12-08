#!/usr/bin/env bash
#  ██████╗  █████╗ ███╗   ███╗███████╗██╗      █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔══██╗██╔══██╗████╗ ████║██╔════╝██║     ██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ██████╔╝███████║██╔████╔██║█████╗  ██║     ███████║    ██████╔╝██║██║     █████╗
#  ██╔═══╝ ██╔══██║██║╚██╔╝██║██╔══╝  ██║     ██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ██║     ██║  ██║██║ ╚═╝ ██║███████╗███████╗██║  ██║    ██║  ██║██║╚██████╗███████╗
#  ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Pamela
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 59
	bspc config bottom_padding 2
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#C574DD"
	bspc config active_border_color "#C574DD"
	bspc config focused_border_color "#8897F4"
	bspc config presel_feedback_color "#FF4971"
}

# Reload terminal colors
set_term_config() {
	sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono NF/g" \
		-e "s/size: .*/size: 10/g"
		
	sed -i "$HOME"/.config/alacritty/rice-colors.yml \
		-e "s/colors: .*/colors: *pamela_color_scheme/"
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
		-e "s/background .*/background \"#1D1F28\"/" \
		-e "s/vertical .*/vertical true/" \
		-e "s/geometry .*/geometry 1x1-998+54/" \
		-e "s/grow_gravity .*/grow_gravity NE/" \
		-e "s/icon_gravity .*/icon_gravity NE/"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 9/g" \
		-e "s/frame_color = .*/frame_color = \"#1D1F28\"/g" \
		-e "s/separator_color = .*/separator_color = \"#8897F4\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#79E6F3'/g"
		
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#1D1F28"
			foreground = "#FDFDFD"

			[urgency_normal]
			timeout = 6
			background = "#1D1F28"
			foreground = "#FDFDFD"

			[urgency_critical]
			timeout = 0
			background = "#1D1F28"
			foreground = "#FDFDFD"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Pamela rice
\$bg: #1D1F28;
\$bg-alt: #1F222B;
\$fg: #FDFDFD;
\$black: #56687E;
\$lightblack: #262831;
\$red: #F37F97;
\$blue: #8897F4;
\$cyan: #79E6F3;
\$magenta: #B043D1;
\$green: #90ceaa;
\$yellow: #F2A272;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Pamela
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #1D1F28/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #a5b6cf/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #1F222B/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #a5b6cf/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #56687E/'
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e '22s/\(font: \).*/\1"Terminess Nerd Font Mono Bold 10";/' \
		-e 's/\(background: \).*/\1#1D1F28;/' \
		-e 's/\(background-alt: \).*/\1#1D1F28E0;/' \
		-e 's/\(foreground: \).*/\1#c0caf5;/' \
		-e 's/\(selected: \).*/\1#6C77BB;/' \
		-e 's/[^/]*-rofi/pa-rofi/'
		
	# WallSelect menu colors	
	sed -i "$HOME/.config/bspwm/scripts/WallSelect.rasi" \
		-e 's/\(main-bg: \).*/\1#1D1F28BF;/' \
		-e 's/\(main-fg: \).*/\1#c0caf5;/' \
		-e 's/\(select-bg: \).*/\1#6C77BB;/' \
		-e 's/\(select-fg: \).*/\1#1D1F28;/'
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		(MONITOR=$mon polybar -q pam1 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam2 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam3 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam4 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam5 -c ${rice_dir}/config.ini)&
		(MONITOR=$mon polybar -q pam6 -c ${rice_dir}/config.ini)&
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
