#!/bin/sh

cat >"$HOME"/.config/bspwm/eww/colors.scss <<-EOF
\$bg: ${bg};
\$bg-alt: ${accent_color};
\$fg: ${fg};
\$black: ${blackb};
\$red: ${red};
\$green: ${green};
\$yellow: ${yellow};
\$blue: ${blue};
\$magenta: ${magenta};
\$cyan: ${cyan};
\$archicon: ${arch_icon};
EOF
