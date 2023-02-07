#!/usr/bin/env bash

# @requires: pactl

SINK=$(pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1)

percentage () {
  local val=$(echo $1 | tr '%' ' ' | awk '{print $1}')
}

get_percentage () {
  local muted=$(pamixer --get-volume-human)
  if [[ $muted == 'muted' ]]; then
    echo 0%
  else
    per=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
    echo "${per}%"
  fi
}

get_icon () {
  local vol=$(get_percentage)
  if [[ $vol == "0%" ]]; then
    echo "images/icons/volume/mute.png"
  else
    echo "images/icons/volume/volume.png"
  fi
}

get_vol () {
  local percent=$(get_percentage)
  echo $percent | tr -d '%'
}

if [[ $1 == "--icon" ]]; then
  get_icon
fi

if [[ $1 == "--percentage" ]]; then
  get_percentage
fi

if [[ $1 == "--vol" ]]; then
  get_vol
fi

if [[ $1 == "--toggle-muted" ]]; then
	pamixer -t
fi

if [[ $1 == "set" ]]; then
  val=$(echo $2 | tr '.' ' ' | awk '{print $1}')
  if test $val -gt 100; then
    val=100
  fi
  pactl set-sink-volume $SINK $val%
fi
