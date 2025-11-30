#!/usr/bin/env bash

DIR="$HOME/.config/wallpapers/"
CACHE="$HOME/.cache/last_wallpaper"

# Collect images
IMAGES=$(find "$DIR" -maxdepth 1 -type f \
  \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) |
  sort)

# Exit and notify if no images found
if [ -z "$IMAGES" ]; then
  notify-send "wallpaper.sh" "No images found in $DIR"
  exit 1
fi

# Get current wallpaper path for auto-switching index
CURRENT_IMG=$(hyprctl hyprpaper listactive | head -n 1 | awk -F'=' '{print $2}' | sed 's/^[[:space:]]*//')

# Find its index in the list (0 based)
INDEX=""
if [ -n "$CURRENT_IMG" ]; then
  INDEX=$(printf '%s\n' "$IMAGES" | awk -v cur="$CURRENT_IMG" '
    BEGIN { i = 0 }
    $0 == cur { print i; exit }
    { i ++ }')
fi

# Pick an image with fuzzel, preselect current if found
if [ -n "$INDEX" ]; then
  IMG=$(printf '%s\n' "$IMAGES" | sed "s|^$DIR||" | fuzzel --dmenu -p "Wallpaper >" --select-index="$INDEX")
else
  IMG=$(printf '%s\n' "$IMAGES" | sed "s|^$DIR||" | fuzzel --dmenu -p "Wallpaper >")
fi

# If nothing chosen, exit
[ -z "$IMG" ] && exit 0

# Turn chosen filename back into full path
WALL="$DIR$IMG"

# Apply with hyprpaper
hyprctl hyprpaper preload "$WALL"
hyprctl hyprpaper wallpaper ",$WALL"

# Cache selected wallpaper for next boot
echo "$WALL" >"$CACHE"
