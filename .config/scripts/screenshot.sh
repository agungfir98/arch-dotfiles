#!/bin/bash

# Define screenshot directory
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR" # Ensure the directory exists

# Define filename format
FILENAME="screenshot_$(date +'%Y%m%d_%H%M%S').png"
FULL_PATH="$SCREENSHOT_DIR/$FILENAME"

case "$1" in
"full")
  grim "$FULL_PATH"
  grim - | wl-copy
  notify-send "Screenshot Taken" "Full screen saved to $FULL_PATH and copied to clipboard." -i $FULL_PATH
  ;;
"active")
  # Get active window geometry using hyprctl and jq
  ACTIVE_WINDOW_GEOMETRY=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
  grim -g "$ACTIVE_WINDOW_GEOMETRY" "$FULL_PATH"
  grim -g "$ACTIVE_WINDOW_GEOMETRY" - | wl-copy
  notify-send "Screenshot Taken" "Active window saved to $FULL_PATH and copied to clipboard." -i $FULL_PATH
  ;;
"area")
  # Interactive region selection with slurp
  SELECTED_REGION=$(slurp -d) # -d dims the screen during selection

  if [ -z "$SELECTED_REGION" ]; then
    notify-send "Screenshot Cancelled" "No region selected."
    exit 1
  fi

  grim -g "$SELECTED_REGION" "$FULL_PATH"
  grim -g "$SELECTED_REGION" - | wl-copy
  notify-send "Screenshot Taken" "Selected area saved to $FULL_PATH and copied to clipboard." -i $FULL_PATH

  ;;
*)
  echo "Usage: $0 {full|active|area}"
  exit 1
  ;;
esac
