#!/bin/sh
for base in \
    "$HOME/.config/mozilla/firefox" \
    "$HOME/.mozilla/firefox"
do
    for profile in "$base"/*.default-release; do
        [ -d "$profile" ] || continue

        mkdir -p "$profile/chrome"

        _write "$profile/chrome/Colors.css" << EOF
/** Style and colors generated for the ${RICE} theme. **/

:root {
    --z0mbi3-bg: $bg;
    --z0mbi3-fg: $fg;
    --z0mbi3-accent-color: $magenta;
    --z0mbi3-accent-color-inactive: $accent_color;
    --z0mbi3-black: $black;
    --z0mbi3-red: $red;
    --z0mbi3-green: $green;
    --z0mbi3-yellow: $yellow;
    --z0mbi3-blue: $blue;
    --z0mbi3-magenta: $magenta;
    --z0mbi3-cyan: $cyan;
    --z0mbi3-white: $white;
}
EOF
    done
done

# Modify startpage colors

_write "$HOME/.local/share/startup-page/colors.css" << EOF
/** Style and colors generated for the ${RICE} theme. **/

:root {
  /* Font Size */
  --fg-primary: 12vh; /* Time and Greetings */
  --fg-secondary: 3vh; /* Greetings and Weather widger */
  --fg-date: 8vh; /* Date */
  --fg-list: 2vh; /* Links List */
  --icon: 3vh; /* Icon Size */

  /* Fonts Color */
  --fg: $fg; /* Foreground color */
  --sfg: $bg; /* Sceondary Foreground color */

  /* Light Colors  */
  --accent: $magenta; /* Hover color */
  --background: $bg; /* Background color */
  --cards: $accent_color; /* Cards color */

  /* Image background  */
  --imgbg: url(assets/background.jpg); /* Image URL */
  --imgcol: linear-gradient(
    rgba(255, 255, 255, 0.7),
    rgba(255, 255, 255, 0.7)
  ); /* Filter color */
}

.darktheme {
  /* Dark Colors  */
  --accent: $magenta; /* Hover color */
  --background: $bg; /* Background color */
  --cards: $accent_color; /* Cards color */

  /* Fonts Color */
  --fg: $fg; /* Foreground color */
  --sfg: $bg; /* Secondary Foreground color */

  /* Image background  */
  --imgcol: linear-gradient(
    rgba(0, 0, 0, 0.85),
    rgba(0, 0, 0, 0.85)
  ); /* Filter color */
}
EOF
