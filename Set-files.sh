#!/bin/bash

###
### HYPR Folder
###

makedir -p ~/.config/Hypr

cat <<EOF > ~/.config/Hypr/hyprland.conf
source = ~/Documents/multi_theme_hyprland/themes/Theme_path.conf

source = $Theme_path/Hypr/hyprland.conf
EOF

cat <<EOF > ~/.config/Hypr/hyprlock.conf
source = ~/Documents/multi_theme_hyprland/themes/Theme_path.conf

source = $Theme_path/Hypr/hyprlock.conf
EOF

cat <<EOF > ~/.config/Hypr/hypridle.conf
source = ~/Documents/multi_theme_hyprland/themes/Theme_path.conf

source = $Theme_path/Hypr/hypridle.conf
EOF

###
### Kitty Folder
###

makedir -p ~/.config/Kitty

cat <<EOF > ~/.config/Kitty/Kitty.conf
source = ~/Documents/multi_theme_hyprland/themes/Theme_path.conf

source = $Theme_path/Kitty/Kitty.conf
EOF

###
### Waybar Folder
###

###
### Wofi Folder
###

