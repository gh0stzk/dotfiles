#!/bin/sh

cat >"$HOME"/.config/bspwm/config/st/colorscheme <<-EOF
*background: ${bg}
*foreground: ${fg}

! Black + DarkGrey
*color0:  ${black}
*color8:  ${blackb}

! DarkRed + Red
*color1:  ${red}
*color9:  ${redb}

! DarkGreen + Green
*color2:  ${green}
*color10: ${greenb}

! DarkYellow + Yellow
*color3:  ${yellow}
*color11: ${yellowb}

! DarkBlue + Blue
*color4:  ${blue}
*color12: ${blueb}

! DarkMagenta + Magenta
*color5:  ${magenta}
*color13: ${magentab}

! DarkCyan + Cyan
*color6:  ${cyan}
*color14: ${cyanb}

! LightGrey + White
*color7:  ${white}
*color15: ${whiteb}
EOF

xrdb -merge "$HOME/.config/bspwm/config/st/xresources"
pidof -q st && killall -USR1 -e st
