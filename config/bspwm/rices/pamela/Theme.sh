#!/usr/bin/env bash
#  ╔═╗╔═╗╔╦╗╔═╗╦  ╔═╗  ╦═╗╦╔═╗╔═╗
#  ╠═╝╠═╣║║║║╣ ║  ╠═╣  ╠╦╝║║  ║╣	https://github.com/gh0stzk/dotfiles 
#  ╩  ╩ ╩╩ ╩╚═╝╩═╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Pamela
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 59
		bspc config bottom_padding 2
		bspc config normal_border_color "#C574DD"
		bspc config active_border_color "#C574DD"
		bspc config focused_border_color "#8897F4"
		bspc config presel_feedback_color "#FF4971"
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
				# Colors (Elenapan) Pamela Rice
				colors:
				  primary:
				    background: '#1D1F28'
				    foreground: '#FDFDFD'

				  normal:
				    black:   '#3D4C5F'
				    red:     '#F37F97'
				    green:   '#5ADECD'
				    yellow:  '#F2A272'
				    blue:    '#8897F4'
				    magenta: '#C574DD'
				    cyan:    '#79E6F3'
				    white:   '#FDFDFD'

				  bright:
				    black:   '#56687E'
				    red:     '#FF4971'
				    green:   '#18E3C8'
				    yellow:  '#FF8037'
				    blue:    '#556FFF'
				    magenta: '#B043D1'
				    cyan:    '#3FDCEE'
				    white:   '#BEBEC1'
    
				  cursor:
				    cursor: '#FF4971'
				    text:	'#1D1F28'
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
		-e "s/transparency = .*/transparency = 9/g" \
		-e "s/frame_color = .*/frame_color = \"#1D1F28\"/g" \
		-e "s/separator_color = .*/separator_color = \"#8897F4\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
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

# Launch the bar
launch_bars() {
		eww -c ${rice_dir}/widgets daemon &
		polybar -q pam1 -c ${rice_dir}/config.ini &
		polybar -q pam2 -c ${rice_dir}/config.ini &
		polybar -q pam3 -c ${rice_dir}/config.ini &
		polybar -q pam4 -c ${rice_dir}/config.ini &
		polybar -q pam5 -c ${rice_dir}/config.ini &
		polybar -q pam6 -c ${rice_dir}/config.ini &
}


### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
launch_bars
