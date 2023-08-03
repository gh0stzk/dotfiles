#!/usr/bin/env bash
#       ██╗ █████╗ ███╗   ██╗    ██████╗ ██╗ ██████╗███████╗
#       ██║██╔══██╗████╗  ██║    ██╔══██╗██║██╔════╝██╔════╝
#       ██║███████║██╔██╗ ██║    ██████╔╝██║██║     █████╗  
#  ██   ██║██╔══██║██║╚██╗██║    ██╔══██╗██║██║     ██╔══╝  
#  ╚█████╔╝██║  ██║██║ ╚████║    ██║  ██║██║╚██████╗███████╗
#   ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Jan
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 64
		bspc config bottom_padding 2
		bspc config normal_border_color "#4C3A6D"
		bspc config active_border_color "#4C3A6D"
		bspc config focused_border_color "#785DA5"
		bspc config presel_feedback_color "#070219"
		bspc config left_padding 2
		bspc config right_padding 2
		bspc config window_gap 6
}

# Reload terminal colors
set_term_config() {
		sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono Nerd Font/g" \
		-e "s/size: .*/size: 10/g"
		
		sed -i "$HOME"/.config/alacritty/rice-colors.yml \
		-e "s/colors: .*/colors: *jan_cyberpunk/"
}

# Set compositor configuration
set_picom_config() {
		sed -i "$HOME"/.config/bspwm/picom.conf \
			-e "s/normal = .*/normal =  { fade = true; shadow = false; }/g" \
			-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
			-e "s/corner-radius = .*/corner-radius = 0/g" \
			-e "s/\".*:class_g = 'Alacritty'\"/\"96:class_g = 'Alacritty'\"/g" \
			-e "s/\".*:class_g = 'FloaTerm'\"/\"96:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 8/g" \
		-e "s/frame_color = .*/frame_color = \"#070219\"/g" \
		-e "s/separator_color = .*/separator_color = \"#fb007a\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#f9f9f9'/g"
		
		sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
		cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#070219"
				foreground = "#c0caf5"

				[urgency_normal]
				timeout = 6
				background = "#070219"
				foreground = "#c0caf5"

				[urgency_critical]
				timeout = 0
				background = "#070219"
				foreground = "#c0caf5"
_EOF_
}

# Launch the bar
launch_bars() {
		polybar -q main -c ${rice_dir}/config.ini &
}



### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
launch_bars
