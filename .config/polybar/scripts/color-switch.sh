#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/scripts"

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
-theme $SDIR/rofi/styles.rasi \
<<< "♥ dark|♥ light|\
")"
            case "$MENU" in
				## Dark Theme
				*dark) "$SDIR"/colors-dark.sh --dark ;;
				## Light Theme
				*light) "$SDIR"/colors-light.sh --light ;;
            esac
