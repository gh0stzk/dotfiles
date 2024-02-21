#!/usr/bin/env bash

# sysfetch
# Thanks to u/x_ero for his sysinfo script
# Modified by gh0stzk https://github.com/gh0stzk/dotfiles

# color escapes
CBK=$(tput setaf 0)
CRE=$(tput setaf 1)
CGR=$(tput setaf 2)
CYE=$(tput setaf 3)
CBL=$(tput setaf 4)

CMA=$(tput setaf 5)
CCY=$(tput setaf 6)
CWH=$(tput setaf 7)
CBD=$(tput bold)
CNC=$(tput sgr0)

# vars
FULL=━
EMPTY=━


name=$USER
host=$(uname -n)
distro=$(uname -o | awk -F '"' '/PRETTY_NAME/ { print $2 }' /etc/os-release)
packages=$(pacman -Q | wc -l)
wm=$(xprop -id "$(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}')" -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")
storage=$(df -h --output=used / | awk 'NR == 2 { print $1 }')
term=$(ps -o sid= -p "$$" | xargs ps -o ppid= -p | xargs ps -o comm= -p)
uptm=$(uptime -p | sed -e 's/hour/hr/' -e 's/hours/hrs/' -e 's/minutes/mins/' -e 's/minute/min/' -e 's/up //')

#Cleanup first
clear

# find the center of the screen
COL=$(tput cols)
ROW=$(tput lines)
((PADY = ROW / 2 - 10 - 22 / 2))
((PADX = COL / 2 - 34 / 2))

for ((i = 0; i < PADX; ++i)); do
    PADC="$PADC "
done

for ((i = 0; i < PADY; ++i)); do
    PADR="$PADR\n"
done

# vertical padding
printf "%b" "$PADR"
printf "\n"

PADXX=$((PADX - 3))
for ((i = 0; i < PADXX; ++i)); do
    PADCC="$PADCC "
done

# Ascii art arms
cat <<EOF
$PADCC$CBD                   $CBL.
$PADCC                  $CBL/ $CMA\\
$PADCC                 $CBL/   $CMA\\
$PADCC                $CBL/^.   $CMA\\
$PADCC               $CBL/  .$CWH-$CMA.  \\
$PADCC              $CBL/  (   $CMA) _\\
$PADCC             $CBL/ _.~   $CMA~._^\\
$PADCC            $CBL/.^         $CMA^.\\

EOF

BAR=" ▓▒░"
OUTT="$CBK$BAR$CRE$BAR$CGR$BAR$CYE$BAR$CBL$BAR$CMA$BAR$CCY$BAR$CWH$BAR$CNC"
printf "%s%b\n\n" "$PADC" "$OUTT"


# greetings
printf "%s%b\n" "$PADC" "            Hi $CRE$CBD$name$CNC"
printf "%s%b\n" "$PADC" "      Welcome to $CGR$CBD$host$CNC"
printf "%s%b\n\n" "$PADC" "          up $CCY$CBD$uptm$CNC"

# environment
printf "%s%b" "$PADC" "$CRE        distro $CWH⏹ $CNC$distro\n"
printf "%s%b" "$PADC" "$CBL        kernel $CWH⏹ $CNC$(uname -r)\n"
printf "%s%b" "$PADC" "$CMA      packages $CWH⏹ $CNC${packages}\n"
printf "%s%b" "$PADC" "$CGR         shell $CWH⏹ $CNC${SHELL##*/}\n"
printf "%s%b" "$PADC" "$CYE          term $CWH⏹ $CNC${term}\n"
printf "%s%b" "$PADC" "$CCY            wm $CWH⏹ $CNC${wm}\n"
printf "%s%b" "$PADC" "$CBL          disk $CWH⏹ $CNC${storage} used\n"
printf " %s\n" "$CNC"

# progress bar
draw() {
    perc=$1
    size=$2
    inc=$((perc * size / 100))
    out=
    color="$3"
    for v in $(seq 0 $((size - 1))); do
        test "$v" -le "$inc" &&
        out="${out}\e[1;${color}m${FULL}" ||
        out="${out}\e[0;37m${CWH}${EMPTY}"
    done
    printf "$out"
}

# cpu
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)
c_lvl=$(printf '%s' "$cpu")
printf "%b" "$PADC"
printf "   $CMA%-4s $CWH%-5s %-25s \n" " cpu" "$c_lvl%" "$(draw "$c_lvl" 15 35)"

# ram
ram=$(free | awk '/Mem:/ {print int($3/$2 * 100.0)}')
printf "%b" "$CNC" "$PADC"
printf "   $CMA%-4s $CWH%-5s %-25s \n" " ram" "$ram%" "$(draw "$ram" 15 35)"

# hide the cursor and wait for user input
tput civis
read -n 1

# give the cursor back
tput cnorm
