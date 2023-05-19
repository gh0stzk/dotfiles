#!/usr/bin/env bash
#  ╔═╗╦ ╦╔╗╔╔╦╗╦ ╦╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ║  ╚╦╝║║║ ║ ╠═╣║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝ ╩ ╝╚╝ ╩ ╩ ╩╩╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Cynthia
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

# Reload terminal colors
set_term_config() {
		sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono Nerd Font/g" \
		-e "s/size: .*/size: 10/g"
		
		cat > "$HOME"/.config/alacritty/colors.yml <<- _EOF_
				# Colors Cynthia Rice
				colors:
				  primary:
				    background: '#1f2329'
				    foreground: '#b8bfe5'

				  normal:
				    black:   '#0f1319'
				    red:     '#644d66'
				    green:   '#375759'
				    yellow:  '#736871'
				    blue:    '#3f5273'
				    magenta: '#543f66'
				    cyan:    '#324f66'
				    white:   '#b3b3b3'

				  bright:
				    black:   '#b3b3b3'
				    red:     '#735771'
				    green:   '#3f6566'
				    yellow:  '#807476'
				    blue:    '#465b80'
				    magenta: '#533969'
				    cyan:    '#385a73'
				    white:   '#e5e5e5'
    
				  cursor:
				    cursor: '#465b80'
				    text:	'#e5e5e5'
_EOF_
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
set_term_config
set_picom_config
set_dunst_config
launch_bars
