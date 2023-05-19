#!/usr/bin/env bash
#  ╔═╗╦═╗╦╔═╗╔╦╗╦╔╗╔╔═╗  ╦═╗╦╔═╗╔═╗
#  ║  ╠╦╝║╚═╗ ║ ║║║║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝╩╚═╩╚═╝ ╩ ╩╝╚╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Cristina
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 2
		bspc config bottom_padding 60
		bspc config normal_border_color "#9bced7"
		bspc config active_border_color "#9bced7"
		bspc config focused_border_color "#c3a5e6"
		bspc config presel_feedback_color "#c3a5e6"
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
				# Colors (Rose-Pine Moon) Cristina Rice
				colors:
				  primary:
				    background: '#1f1d29'
				    foreground: '#eaeaea'

				  normal:
				    black:   '#6f6e85'
				    red:     '#ea6f91'
				    green:   '#9bced7'
				    yellow:  '#f1ca93'
				    blue:    '#34738e'
				    magenta: '#c3a5e6'
				    cyan:    '#eabbb9'
				    white:   '#faebd7'

				  bright:
				    black:   '#6f6e85'
				    red:     '#ea6f91'
				    green:   '#9bced7'
				    yellow:  '#f1ca93'
				    blue:    '#34738e'
				    magenta: '#c3a5e6'
				    cyan:    '#ebbcba'
				    white:   '#e0def4'
    
				  cursor:
				    cursor: '#c3a5e6'
				    text:	'#1f1d29'
_EOF_
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
		-e "s/frame_color = .*/frame_color = \"#1f1d29\"/g" \
		-e "s/separator_color = .*/separator_color = \"#ea6f91\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#9bced7'/g"
		
		sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
		cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#1f1d29"
				foreground = "#eaeaea"

				[urgency_normal]
				timeout = 6
				background = "#1f1d29"
				foreground = "#eaeaea"

				[urgency_critical]
				timeout = 0
				background = "#1f1d29"
				foreground = "#eaeaea"
_EOF_
}

# Launch the bar and or eww widgets
launch_bars() {
		eww -c ${rice_dir}/widgets daemon &
		polybar -q cristina-bar -c ${rice_dir}/config.ini &
}


### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
launch_bars
