#!bin/sh

cat > "$HOME/.config/ghostty/themes/gh0stzk" << EOF
# Colors generated for ${RICE} theme.

background = ${bg}
foreground = ${fg}
cursor-color = ${fg}
selection-background = ${fg}
selection-foreground = ${bg}

palette = 0=${black}
palette = 1=${red}
palette = 2=${green}
palette = 3=${yellow}
palette = 4=${blue}
palette = 5=${magenta}
palette = 6=${cyan}
palette = 7=${white}
palette = 8=${blackb}
palette = 9=${redb}
palette = 10=${greenb}
palette = 11=${yellowb}
palette = 12=${blueb}
palette = 13=${magentab}
palette = 14=${cyanb}
palette = 15=${whiteb}
EOF

pkill -USR2 -x ghostty
