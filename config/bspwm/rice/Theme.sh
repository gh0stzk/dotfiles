#!/usr/bin/env bash

# Set bspwm configuration for the rice
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 48
		bspc config bottom_padding 48
		bspc config normal_border_color "#543f66"
		bspc config active_border_color "#543f66"
		bspc config focused_border_color "#465b80"
		bspc config presel_feedback_color "#3f5273"
		bspc config left_padding 2
		bspc config right_padding 2
		bspc config window_gap 6
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

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 4/g" \
		-e "s/frame_color = .*/frame_color = \"#1f2329\"/g" \
		-e "s/separator_color = .*/separator_color = \"#3f5273\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
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

# Launch the bar
launch_bars() {
		polybar -q cyn-bar -c ${rice_dir}/config.ini &
		polybar -q cyn-bar2 -c ${rice_dir}/config.ini &
}


### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_picom_config
set_dunst_config
launch_bars
