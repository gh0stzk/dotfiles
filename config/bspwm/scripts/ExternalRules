#!/usr/bin/env bash
#  ╔═╗═╗ ╦╔╦╗╔═╗╦═╗╔╗╔╔═╗╦    ╦═╗╦ ╦╦  ╔═╗╔═╗
#  ║╣ ╔╩╦╝ ║ ║╣ ╠╦╝║║║╠═╣║    ╠╦╝║ ║║  ║╣ ╚═╗
#  ╚═╝╩ ╚═ ╩ ╚═╝╩╚═╝╚╝╩ ╩╩═╝  ╩╚═╚═╝╩═╝╚═╝╚═╝
#  url: https://github.com/gh0stzk/dotfiles

wid=$1
class=$2
instance=$3
consequences=$4

main () {
case "$class" in
	FloaTerm)
		eval "$consequences"
		[ "$state" ] || echo "state=floating center=on"
		;;
	Updating)
		eval "$consequences"
		[ "$state" ] || echo "state=floating sticky=on center=on"
		;;
	mpv)
	    eval "$consequences"
		[ "$state" ] || echo "state=floating focus=on rectangle=849x477+0+0 center=on"
		;;
	Viewnior)
	    eval "$consequences"
	    [ "$state" ] || echo "state=floating focus=on center=on"
		;;
	whatsapp-nativefier-d40211|TelegramDesktop)
	    eval "$consequences"
	    [ "$state" ] || echo "state=pseudo_tiled desktop=^4 follow=on rectangle=930x617+0+0"
		;;
	retroarch)
	    eval "$consequences"
	    [ "$state" ] || echo "state=pseudo_tiled desktop=^6 follow=on"
	    ;;
	Pavucontrol)
	    eval "$consequences"
	    [ "$state" ] || echo "state=floating center=on"
	    ;;
	Virt-manager)
	    eval "$consequences"
	    [ "$state" ] || echo "state=floating desktop=^5 follow=on center=on"
	    ;;
	Thunar)
	    eval "$consequences"
	    [ "$state" ] || echo "state=pseudo_tiled desktop=^2 rectangle=966x576+0+0 follow=on"
	    ;;
	firefox|Navigator)
	    eval "$consequences"
	    [ "$state" ] || echo "desktop=^3 follow=on"
	    ;;
	 Transmission-gtk)
	    eval "$consequences"
	    [ "$state" ] || echo "desktop=^6 follow=on"
	    ;;
	  Spotify)
		eval "$consequences"
	    [ "$state" ] || echo "state=pseudo_tiled rectangle=1125x600 desktop=^6 follow=on"
		;;
		"") ## spotify hack
        sleep 0.5
		wm_class=($(xprop -id $wid | grep "WM_CLASS" | grep -Po '"\K[^,"]+'))
		class=${wm_class[-1]}
		[[ ${#wm_class[@]} == "2" ]] && instance=${wm_class[0]}
		[[ -n "$class" ]] && main
		;;
esac
}

main
case "$instance" in
     Toolkit)
        eval "$consequences"
        [ "$state" ] || echo "state=floating sticky=on rectangle=500x290+1054+593"
	    ;;
esac  
