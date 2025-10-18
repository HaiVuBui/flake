#!/usr/bin/env bash
set -euo pipefail

DIR="${1:-$HOME/wallpapers}"

# Pick an image via rofi
choice="$(find "$DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' -o -iname '*.gif' \) \
  | sort \
  | rofi -dmenu -i -p 'wallpaper')"

[ -n "${choice:-}" ] || exit 0

# Apply the wallpaper with your preferred transition settings
exec swww img "$choice" \
  --transition-fps 255 \
  --transition-type outer \
  --transition-duration 3

