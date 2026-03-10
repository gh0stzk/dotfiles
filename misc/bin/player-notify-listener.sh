#!/bin/sh

Cover=/tmp/cover.png
bkpCover=~/.config/bspwm/config/assets/fallback.webp
LAST_SONG_FILE="/tmp/last_song.txt"
NOTIFY_TIMES_LOG="/tmp/notify_times.log"
NOTIFY_WINDOW=8
NOTIFY_MAX=2
NOTIFY_REPLACE_ID=424242
NOTIFY_EXPIRE_MS=8000

allow_notification() {
    local now win max log tmp count
    now=$(date +%s)
    win=$NOTIFY_WINDOW
    max=$NOTIFY_MAX
    log="$NOTIFY_TIMES_LOG"
    tmp="${log}.$$"

    if [ -f "$log" ]; then
        awk -v now="$now" -v win="$win" '($1+0) > (now-win){print $1}' "$log" > "$tmp" 2>/dev/null || true
    else
        : > "$tmp"
    fi

    count=$(wc -l < "$tmp" 2>/dev/null || echo 0)
    if [ "$count" -ge "$max" ]; then
        rm -f "$tmp" 2>/dev/null || true
        return 1
    fi

    printf "%s\n" "$now" >> "$tmp"
    mv -f "$tmp" "$log" 2>/dev/null || true
    return 0
}

get_active_player() {
    playerctl -l 2>/dev/null | while read -r player; do
        status=$(playerctl --player="$player" status 2>/dev/null)
        [ "$status" = "Playing" ] && echo "$player" && exit
    done
}

# We won't cache Control at startup; determine the active player per notification
# Notifications delegated to the centralized helper at ~/.local/bin/notify_song


# Escucha continua para cualquier reproductor: determinamos el reproductor activo en cada evento
playerctl metadata --follow 2>/dev/null | while read -r line; do
    # allow the player a short moment to update metadata (some players update asynchronously)
    sleep 0.08
    player_here=$(get_active_player)
    [ -n "$player_here" ] || continue

    new_song=$(playerctl --player="$player_here" metadata --format "{{title}}-{{artist}}")
    last_song=""
    [ -f "$LAST_SONG_FILE" ] && last_song=$(cat "$LAST_SONG_FILE")

    # Notificar solo si es nueva canción
    if [ "$new_song" != "$last_song" ]; then
                    if [ -x "$HOME/.local/bin/notify_song" ]; then
                # small delay to let metadata stabilize and avoid duplicate events
                sleep 0.3
                # re-read metadata and compare again
                new_song_check=$(playerctl --player="$player_here" metadata --format "{{title}}-{{artist}}")
                if [ "$new_song_check" != "$last_song" ]; then
                            # Delegate notification emission to centralized helper only
                            # Force notify to bypass throttling when metadata lags (YouTube Music)
                            "$HOME/.local/bin/notify_song" --force || true
                    # mark as seen
                    echo "$new_song_check" > "$LAST_SONG_FILE" 2>/dev/null || true
                fi
            else
                # notify_song missing: mark as seen to avoid repeated events
                echo "$new_song" > "$LAST_SONG_FILE" 2>/dev/null || true
            fi
    fi
done

