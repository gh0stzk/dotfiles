#!/bin/sh

_write "$HOME/.config/nvim/lua/generated/theme.lua" << EOF
-- Colors generated for the ${RICE} theme.
return {
    base00 = "${bg}",
    base01 = "${bg}",
    base02 = "${accent_color}",
    base03 = "${green}",
    base04 = "${white}",
    base05 = "${fg}",
    base06 = "${yellow}",
    base07 = "${white}",
    base08 = "${redb}",
    base09 = "${magenta}",
    base0A = "${yellow}",
    base0B = "${blueb}",
    base0C = "${yellow}",
    base0D = "${cyan}",
    base0E = "${magentab}",
    base0F = "${red}",
}
EOF

pkill -SIGUSR1 nvim
