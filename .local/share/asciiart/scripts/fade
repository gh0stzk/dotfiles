#!/bin/sh

# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after 
#    colors (f = foreground, b = background), and use the 'off'
#    feature for anything you turn on.
# Author: pfh
# Source: http://crunchbang.org/forums/viewtopic.php?pid=127737#p127737

initializeANSI()
{
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackfbright="${esc}[30m";   redfbright="${esc}[31m";    greenfbright="${esc}[32m"
  yellowfbright="${esc}[33m"   bluefbright="${esc}[34m";   purplefbright="${esc}[35m"
  cyanfbright="${esc}[96m";    whitefbright="${esc}[97m"
  
  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

initializeANSI

cat << EOF

 ${redf}▒▒▒▒${reset} ${boldon}${redfbright}▒▒${reset}   ${greenf}▒▒▒▒${reset} ${boldon}${greenfbright}▒▒${reset}   ${yellowf}▒▒▒▒${reset} ${boldon}${yellowfbright}▒▒${reset}   ${bluef}▒▒▒▒${reset} ${boldon}${bluefbright}▒▒${reset}   ${purplef}▒▒▒▒${reset} ${boldon}${purplefbright}▒▒${reset}   ${cyanf}▒▒▒▒${reset} ${boldon}${cyanfbright}▒▒${reset} 
 ${redf}▒▒ ■${reset} ${boldon}${redfbright}▒▒${reset}   ${greenf}▒▒ ■${reset} ${boldon}${greenfbright}▒▒${reset}   ${yellowf}▒▒ ■${reset} ${boldon}${yellowfbright}▒▒${reset}   ${bluef}▒▒ ■${reset} ${boldon}${bluefbright}▒▒${reset}   ${purplef}▒▒ ■${reset} ${boldon}${purplefbright}▒▒${reset}   ${cyanf}▒▒ ■${reset} ${boldon}${cyanfbright}▒▒${reset}  
 ${redf}▒▒ ${reset}${boldon}${redfbright}▒▒▒▒${reset}   ${greenf}▒▒ ${reset}${boldon}${greenfbright}▒▒▒▒${reset}   ${yellowf}▒▒ ${reset}${boldon}${yellowfbright}▒▒▒▒${reset}   ${bluef}▒▒ ${reset}${boldon}${bluefbright}▒▒▒▒${reset}   ${purplef}▒▒ ${reset}${boldon}${purplefbright}▒▒▒▒${reset}   ${cyanf}▒▒ ${reset}${boldon}${cyanfbright}▒▒▒▒${reset}  

EOF
