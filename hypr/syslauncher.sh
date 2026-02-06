#!/usr/bin/env bash
set -euo pipefail

ROFI_CONFIG="$HOME/.config/rofi/sl.rasi"

# --- Define menu options (no icons) ---
MENU_ITEMS=(
    "󱂬   Waybar Layout"
    "󱓞   Rofi Layout"
    "󰏘   Theme Switcher"
    "󰸉   Wallpaper Switcher"
    "󰔎   Toggle Dark/Light"
    "   Clipboard"
    "   Capture"
    "󰞅   Emoji"
    "󰌌   Cheatsheet"
)

# --- Show rofi menu ---
SELECTED=$(printf "%s\n" "${MENU_ITEMS[@]}" | rofi -dmenu -i -p "Launcher" -config "$ROFI_CONFIG")

[ -z "$SELECTED" ] && exit 0  # Cancelled

# --- Run the corresponding script ---
case "$SELECTED" in
    "󱂬   Waybar Layout")
        "$HOME/.config/waybar/scripts/waybar-theme-rofi.sh"
        ;;
    "󱓞   Rofi Layout")
        "$HOME/.config/rofi/scripts/rofi-theme-switcher.sh"
        ;;
    "󰏘   Theme Switcher")
        "$HOME/.config/hypr/themepicker.sh"
        ;;
    "󰸉   Wallpaper Switcher")
        "$HOME/.config/hypr/wppicker.sh"
        ;;
    "󰔎   Toggle Dark/Light")
		"$HOME/.config/matugen/toggle-theme.sh"
		;;
    "   Clipboard")
        "$HOME/.config/hypr/clip.sh"
        ;;
    "   Capture")
		"$HOME/.config/hypr/screenshotrofi.sh"
		;;
	"󰞅   Emoji")
		"$HOME/.config/hypr/emoji.sh"
		;;
    "󰌌   Cheatsheet")
		"$HOME/.config/rofi/scripts/key.sh"
		;;
    *)
        echo "Unknown option: $SELECTED"
        ;;
esac
