# This file launch the bar/s

# Function for generating workspaces.yuck file with eww widgets
generate_eww_workspaces() {
    local eww_file monitors count m workspace_name
    local listen_workspaces widgets workspace_widgets

    eww_file="${HOME}/.config/bspwm/rices/${RICE}/bar/workspaces.yuck"
    monitors=$(bspc query -M --names)
    count=0
    listen_workspaces=""
    widgets=""
    workspace_widgets=";; Workspaces Widgets ;;\n"

    printf "%s\n" ";; Workspaces ;;" > "$eww_file"

    for m in $monitors; do
        workspace_name="workspace${count}"
        listen_workspaces="${listen_workspaces}(deflisten ${workspace_name} \"scripts/WorkSpaces $m\")\n"
        widgets="${widgets}           (box :visible { monitor==\"$m\" } (${workspace_name}))\n"
        workspace_widgets="${workspace_widgets}(defwidget ${workspace_name} [] (literal :content ${workspace_name}))\n"
        count=$((count + 1))
    done

    printf "%b" "$listen_workspaces" >> "$eww_file"
    printf "%b" "$workspace_widgets" >> "$eww_file"
    printf "%b" ";; Workspaces Main Widget ;;\n(defwidget workspaces [monitor]\n   (box    :orientation \"v\"\n           :space-evenly \"false\"\n           :valign \"start\"\n$widgets))" >> "$eww_file"
}

generate_eww_workspaces

for m in $(bspc query -M --names); do
    eww -c "${HOME}/.config/bspwm/rices/${RICE}/bar" open bar --id "$m" --arg monitor="$m" --toggle
done

# Fix eww when entering fullscreen state
bspc subscribe node_state | while read -r _ _ _ _ state flag; do
    [ "$state" = "fullscreen" ] || continue
    if [ "$flag" = "on" ]; then
        HideBar -h
    else
        HideBar -u
    fi
done &
