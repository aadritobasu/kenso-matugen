#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/matugen"
THEME_FILE="$CONFIG_DIR/theme.txt"
SKIP_FILE="$CONFIG_DIR/matugenskiposthook"
WALLPAPER="$HOME/.config/hypr/current_wallpaper"   # change if needed

mkdir -p "$CONFIG_DIR"

# Default theme
THEME="dark"
[[ -f "$THEME_FILE" ]] && THEME=$(cat "$THEME_FILE")

# Toggle theme
if [[ "$THEME" == "dark" ]]; then
  NEW_THEME="light"
else
  NEW_THEME="dark"
fi

# Write files
echo "$NEW_THEME" > "$THEME_FILE"
echo "0" > "$SKIP_FILE"   # skip icon hook for toggle

# Run matugen
matugen image "$WALLPAPER" -m "$NEW_THEME"
swaync-client -R
swaync-client -rs
notify-send "Theme Toggled" "$THEME → $NEW_THEME"
