#!/usr/bin/env bash
#  ███╗   ███╗███████╗██████╗ ██╗ █████╗      ██████╗ ██████╗ ███╗   ██╗████████╗██████╗  ██████╗ ██╗
#  ████╗ ████║██╔════╝██╔══██╗██║██╔══██╗    ██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔══██╗██╔═══██╗██║
#  ██╔████╔██║█████╗  ██║  ██║██║███████║    ██║     ██║   ██║██╔██╗ ██║   ██║   ██████╔╝██║   ██║██║
#  ██║╚██╔╝██║██╔══╝  ██║  ██║██║██╔══██║    ██║     ██║   ██║██║╚██╗██║   ██║   ██╔══██╗██║   ██║██║
#  ██║ ╚═╝ ██║███████╗██████╔╝██║██║  ██║    ╚██████╗╚██████╔╝██║ ╚████║   ██║   ██║  ██║╚██████╔╝███████╗
#  ╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
#
#	Author  : gh0stzk
#	Url     : https://github.com/gh0stzk/dotfiles
#	Info    : This script uses playerctl and mpc to control the multimedia playback
#           "stop, pause, play, next, previous" of different players like
#           spotify, ncmpcpp, clementine, strawberry and others.


# Set the player
[ -n "$(pgrep spotify)" ] && Control="spotify" || Control="MPD"

# Here the cover image will be saved.
Cover=/tmp/cover.png
# if cover not found in metadata use this instead
bkpCover=~/.config/bspwm/src/assets/fallback.webp
# mpd music directory for mpd clients.
mpddir=~/Music
LAST_SONG_FILE="/tmp/last_song.txt"

case $Control in
    MPD)
        case $1 in
            --next)
                mpc -q next
                ;;
            --previous)
                mpc -q prev
                ;;
            --toggle)
                mpc -q toggle
                ;;
            --stop)
                mpc -q stop
                ;;
            --title)
                title=$(mpc -f %title% current)
                echo "${title:-Play Something}"
                ;;
            --artist)
                artist=$(mpc -f %artist% current)
                echo "${artist:-No Artist}"
                ;;
            --status)
                status=$(mpc status | head -2 | tail -1 | cut -c2-8 | sed 's/]//g' | sed 's/./\U&/')
                echo "${status:-Stopped}"
                ;;
            --player)
                echo "$Control"
                ;;
            --cover)
                current_song=$(mpc current -f "%title%-%artist%")
				last_song=""
				[ -f "$LAST_SONG_FILE" ] && last_song=$(cat "$LAST_SONG_FILE")

				if [ "$current_song" != "$last_song" ] || [ ! -f "$Cover" ]; then
					ffmpeg -i "$mpddir/$(mpc current -f %file%)" "${Cover}" -y &> /dev/null || cp $bkpCover $Cover
					echo "$current_song" > "$LAST_SONG_FILE"
				fi

				echo "$Cover"
                ;;
            nccover)
                ffmpeg -i "$mpddir"/"$(mpc current -f %file%)" "${Cover}" -y &> /dev/null || cp $bkpCover $Cover
                ;;
            --position)
                position=$(mpc status %currenttime%)
                echo "${position:-0:00}"
                ;;
            --positions)
                positions=$(mpc status %currenttime% | awk -F: '{print ($1 * 60) + $2}')
                echo "${positions:-0}"
                ;;
            --length)
                length=$(mpc status %totaltime%)
                echo "${length:-0:00}"
                ;;
            --lengths)
                lengths=$(mpc status %totaltime% | awk -F: '{print ($1 * 60) + $2}')
                echo "${lengths:-0}"
                ;;
            --shuffle)
                shuffle=$(mpc status | sed -n '3s/.*random: \([^ ]*\).*/\1/p' | sed 's/.*/\u&/')
                echo "${shuffle:-Off}"
                ;;
            --loop)
                loop=$(mpc status | sed -n '3s/.*repeat: \([^ ]*\).*/\1/p' | sed 's/.*/\u&/')
                echo "${loop:-Off}"
                ;;
        esac
        ;;
    *)
        case $1 in
            --next)
                playerctl --player="$Control" next
                ;;
            --previous)
                playerctl --player="$Control" previous
                ;;
            --toggle)
                playerctl --player="$Control" play-pause
                ;;
            --stop)
                playerctl --player="$Control" stop
                ;;
            --title)
                title=$(playerctl --player="$Control" metadata --format "{{title}}")
                echo "${title:-Play Something}"
                ;;
            --artist)
                artist=$(playerctl --player="$Control" metadata --format "{{artist}}")
                echo "${artist:-No Artist}"
                ;;
            --status)
                status=$(playerctl --player="$Control" status)
                echo "${status:-Stopped}"
                ;;
            --player)
                echo "$Control"
                ;;
            --cover)
                current_song="$(playerctl --player="$Control" metadata --format '{{title}}-{{artist}}')"
				last_song=""
				[ -f "$LAST_SONG_FILE" ] && last_song=$(cat "$LAST_SONG_FILE")

				if [ "$current_song" != "$last_song" ] || [ ! -f "$Cover" ]; then
					albumart="$(playerctl --player="$Control" metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')"
					if [[ $(playerctl --player="$Control" metadata mpris:artUrl) ]]; then
						curl -s "$albumart" --output $Cover
					else
						cp $bkpCover $Cover
					fi
				echo "$current_song" > "$LAST_SONG_FILE"
				fi

				echo "$Cover"
                ;;
            --position)
                position=$(playerctl --player="$Control" position --format "{{ duration(position) }}")
                echo "${position:-0:00}"
                ;;
            --positions)
                positions=$(playerctl --player="$Control" position | sed 's/..\{6\}$//')
                echo "${positions:-0}"
                ;;
            --length)
                length=$(playerctl --player="$Control" metadata --format "{{ duration(mpris:length) }}")
                echo "${length:-0:00}"
                ;;
            --lengths)
                lengths=$(playerctl --player="$Control" metadata mpris:length | sed 's/.\{6\}$//')
                echo "${lengths:-0}"
                ;;
            --shuffle)
                shuffle=$(playerctl --player="$Control" shuffle)
                echo "${shuffle:-Off}"
                ;;
            --loop)
                loop=$(playerctl --player="$Control" loop)
                echo "${loop:-None}"
                ;;
        esac
esac 2>/dev/null
