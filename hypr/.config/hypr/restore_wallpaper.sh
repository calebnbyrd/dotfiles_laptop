#!/usr/bin/env bash

CACHE="$HOME/.cache/last_wallpaper"

# Use cached wallpaper if it exists
if [ -f "$CACHE" ]; then
  WALL=$(cat "$CACHE")
  if [ -f "$WALL" ]; then
    hyprctl hyprpaper preload "$WALL"
    hyprctl hyprpaper wallpaper ", $WALL"
    exit 0
  fi
fi

# Fallback to first image in wallpaper
DIR="$HOME/.config/wallpapers/"
if [ -d "$DIR" ]; then
  WALL=$(find "$DIR" -maxdepth 1 -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) |
    sort | head -n1)
  [ -z "$WALL" ] && exit 0
  hyprctl hyprpaper preload "$WALL"
  hyprctl hyprpaper wallpaper ", $WALL"
fi
