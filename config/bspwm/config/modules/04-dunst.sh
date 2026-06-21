#!/bin/sh

cat > "$HOME/.config/dunst/dunstrc.d/theme.conf" << EOF
# Style and colors generated for the ${RICE} theme.

[global]
origin = ${dunst_origin}
offset = ${dunst_offset}

transparency = ${dunst_transparency}
corner_radius = ${dunst_corner_radius}

frame_width = ${dunst_border}
frame_color = "${dunst_frame_color}"

font = ${dunst_font}
icon_theme = "${dunst_icon_theme}, Adwaita""

format = "<span size='xx-large' font_desc='Cantarell 9' weight='bold' foreground='${blue}'>%s</span>\n%b"

[urgency_low]
timeout = 3
background = "${bg}"
foreground = "${green}"

[urgency_normal]
timeout = 5
background = "${bg}"
foreground = "${fg}"

[urgency_critical]
timeout = 0
background = "${bg}"
foreground = "${red}"
EOF

dunstctl reload
