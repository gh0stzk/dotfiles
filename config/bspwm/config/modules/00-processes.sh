#!/bin/sh

# Function to wait for processes to finish correctly
wait_for_termination() {
    process_name="$1"
    while pgrep -f "$process_name" >/dev/null; do
        sleep 0.2
    done
}

# Kill polybar or eww bars when you switch from the current theme to another
if pgrep -x polybar >/dev/null; then
    polybar-msg cmd quit >/dev/null
    wait_for_termination "polybar"
elif pgrep -f "eww.*bar" >/dev/null; then
    pkill -f "eww.*bar"
    wait_for_termination "eww.*bar"
fi

# Kill the fix for eww in fullscreen, we don't need it in themes with polybar
if pgrep -f "bspc subscribe node_state" >/dev/null; then
    pkill -f "bspc subscribe node_state"
    wait_for_termination "bspc subscribe node_state"
fi

# Kill animated wallpaper if is active
if pgrep -x xwinwrap >/dev/null; then
    pkill xwinwrap
    wait_for_termination "xwinwrap"
fi

if [ -f /tmp/wall_refresh.pid ]; then
    kill $(cat /tmp/wall_refresh.pid) 2>/dev/null
    rm -f /tmp/wall_refresh.pid
fi
