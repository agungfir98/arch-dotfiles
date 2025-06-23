#!/usr/bin/env bash

picture_list=$(find $HOME/Pictures/wallpaper/gruvbox -type f)

chosen_picture=$(echo -e "$toggle\n$picture_list" | uniq -u | rofi -dmenu -i show-icons -selected-row 1 -p "Wallpaper: ")

if [ -z "$chosen_picture" ]; then
  exit
else
  notify-send "Setting wallpaper to $chosen_picture"

  swww img $chosen_picture --transition-type any --transition-duration 2 --transition-fps=60
fi
