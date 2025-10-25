#!/usr/bin/env bash
set -euo pipefail

# --- configurable defaults ---
WALL_DIR="${1:-$HOME/wallpaper}"     # pass a dir as $1 to override
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/rofi-wallpapers"
THUMB_SIZE="${THUMB_SIZE:-512x288}"            # change if you want larger/smaller thumbs
LINES="${LINES:-12}"                           # number of visible rows in rofi
TRANSITION="${TRANSITION:-wipe}"               # swww transition (e.g., wipe, any, grow, simple, fade)
DURATION="${DURATION:-0.75}"                   # seconds
SWWW_FLAGS=${SWWW_FLAGS:-"--resize crop"}      # extra flags to swww img

# --- deps check ---
need() { command -v "$1" >/dev/null 2>&1 || { echo "Missing dependency: $1" >&2; exit 1; }; }
need rofi
need swww
# convert is optional; we can fall back to full-size images as icons if absent.
HAS_CONVERT=1; command -v convert >/dev/null 2>&1 || HAS_CONVERT=0

# --- ensure dirs ---
mkdir -p "$CACHE_DIR"

# --- gather images ---
mapfile -t WALLS < <(find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.avif' \) | sort -f)
if [[ ${#WALLS[@]} -eq 0 ]]; then
  rofi -e "No images found in: $WALL_DIR"
  exit 0
fi

# --- build menu entries with per-entry icons ---
# rofi supports per-entry icons using the NUL-style key: value syntax: "label\0icon\x1f/path/to/icon"
entries=()

thumb_path() {
  # stable cache filename: sha1 of full path + original extension (but we write jpg/png depending on convert support)
  local f="$1"
  local hash
  hash=$(printf '%s' "$f" | sha1sum | awk '{print $1}')
  # prefer jpg thumbnails for broad compatibility
  printf '%s/%s.jpg' "$CACHE_DIR" "$hash"
}

make_thumb() {
  local src="$1" dst="$2"
  [[ $HAS_CONVERT -eq 0 ]] && return 1
  # create thumbnail if missing or older than source
  if [[ ! -s "$dst" || "$src" -nt "$dst" ]]; then
    # fast, good-looking thumbnail
    convert "$src" -auto-orient -thumbnail "$THUMB_SIZE^" -gravity center -extent "$THUMB_SIZE" -strip "$dst" 2>/dev/null || return 1
  fi
  return 0
}

# Add a "Random" pseudo-entry
entries+=("🎲  Random\0icon\x1f$(thumb_path "RANDOM")")

for f in "${WALLS[@]}"; do
  base="$(basename "$f")"
  tpath="$(thumb_path "$f")"

  if ! make_thumb "$f" "$tpath"; then
    # fallback: use the original image as the icon (rofi will scale it)
    tpath="$f"
  fi

  # We display a nice name but keep the absolute path in the meta for later parsing
  # rofi will output the *displayed* text, so we stash the path in a hidden delimiter, too.
  entries+=("$base — $(dirname "$f")\0icon\x1f$tpath\0meta\x1f$f")
done

# Join entries with newlines (rofi expects newline-separated)
menu="$(printf '%s\n' "${entries[@]}")"

# --- rofi invocation ---
choice="$(printf '%b' "$menu" | rofi -dmenu \
  -i -p "Wallpaper" -show-icons \
  -theme-str "window { width: 56rem; } listview { lines: ${LINES}; } element-icon { size: 160px; } element-text { highlight: underline; }" \
  -markup-rows \
  )" || exit 1

# If nothing chosen
[[ -z "${choice:-}" ]] && exit 0

# Map selection back to a real file path.
# If "Random" picked, choose a random from the list.
if [[ "$choice" == "🎲  Random" ]]; then
  pick="${WALLS[$RANDOM % ${#WALLS[@]}]}"
else
  # Find the matching line to extract its meta (full path).
  # We re-run the menu building but only grep the chosen visible label.
  # To avoid locale/sed issues, use awk matching on the visible prefix up to the icon key.
  while IFS= read -r line; do
    label="${line%%$'\0'icon*}"
    meta="${line#*"$'\0'meta"$'\x1f'}"
    if [[ "$label" == "$choice" ]]; then
      pick="$meta"
      break
    fi
  done < <(printf '%b' "$menu")
fi

if [[ -z "${pick:-}" ]]; then
  rofi -e "Couldn't resolve selection."
  exit 1
fi

# --- ensure swww running ---
if ! swww query >/dev/null 2>&1; then
  swww init
  # give the backend a moment in some WMs
  sleep 0.1
fi

# --- set wallpaper with transition ---
swww img "$pick" --transition-type "$TRANSITION" --transition-duration "$DURATION" $SWWW_FLAGS

