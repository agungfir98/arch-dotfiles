#!/bin/bash

# Map class names to Nerd Font icons
declare -A icons=(
  ["firefox"]=""
  ["brave"]=""
  ["chromium"]=""
  ["google-chrome"]=""
  ["code"]=""
  ["nvim"]=""
  ["kitty"]=""
  ["alacritty"]=""
  ["foot"]=""
  ["wezterm"]=""
  ["discord"]=""
  ["spotify"]=""
  ["vlc"]="嗢"
  ["mpv"]=""
  ["thunar"]=""
  ["nautilus"]=""
  ["pcmanfm"]=""
  ["gimp"]=""
  ["libreoffice"]=""
  ["obs"]=""
  ["steam"]=""
  ["telegram-desktop"]=""
  ["signal"]=""
  ["postman"]=""
  ["slack"]=""
  ["zathura"]=""
  ["evince"]=""
  ["blueman-manager"]=""
  ["pavucontrol"]=""
  ["gnome-settings"]=""
  ["lxappearance"]=""
  ["nm-connection-editor"]=""
  ["qutebrowser"]=""
  ["vscodium"]=""
)

# Get the active workspace ID
active_workspace=$(hyprctl activeworkspace -j | jq '.id')

# Get classes of clients in the active workspace
hyprctl clients -j |
  jq -r --argjson ws "$active_workspace" '.[] | select(.workspace.id == $ws) | .class' |
  sort | uniq |
  while read -r class; do
    icon="${icons[${class,,}]}"
    [ -z "$icon" ] && icon=""
    echo -n "$icon  "
  done

echo
