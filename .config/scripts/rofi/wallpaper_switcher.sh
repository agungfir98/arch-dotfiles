#!/usr/bin/env bash

wallpaper_dir="$HOME/Pictures/wallpaper/gruvbox"
picture_list=$(find "$wallpaper_dir" -type f)

declare -A picture_map

filename_list=""
while IFS= read -r path; do
  filename=$(basename "$path")
  picture_map["$filename"]="$path"
  filename_list+="$filename"$'\n'
done <<<"$picture_list"

chosen_filename=$(echo -e "${filename_list%$'\n'}" | rofi -dmenu -i -p "Wallpaper: ")

if [ -z "$chosen_filename" ]; then
  exit
fi

chosen_wallpaper="${picture_map[$chosen_filename]}"

notify-send "Setting wallpaper to $chosen_wallpaper"

swww img $chosen_wallpaper --transition-type any --transition-duration 2 --transition-fps=60
