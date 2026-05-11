#!/bin/bash

###
### HYPR Folder
###

mkdir -p ~/.config/hypr

touch ~/.config/hypr/hyprland.lua
cat <<EOF > ~/.config/hypr/hyprland.lua
local json = require("dkjson")

local file = io.open(os.getenv("HOME") .. "/Documents/multi_theme_hyprland/themes/theme.json", "r")
local content = file:read("*a")
file:close()

local data = json.decode(content)

local theme = data.theme

hyprland.source(
    os.getenv("HOME") ..
    "/Documents/multi_theme_hyprland/themes/" ..
    theme ..
    "/hypr/hyprland.conf"
)
EOF

#cat <<EOF > ~/.config/hypr/hyprlock.conf
#source = ~/Documents/multi_theme_hyprland/themes/Theme_path.conf

#source = $Theme_path/hypr/hyprlock.conf
#EOF

#cat <<EOF > ~/.config/hypr/hypridle.conf
#source = ~/Documents/multi_theme_hyprland/themes/Theme_path.conf

#source = $Theme_path/hypr/hypridle.conf
#EOF

###
### Kitty Folder
###

#makedir -p ~/.config/Kitty

#cat <<EOF > ~/.config/Kitty/Kitty.conf
#source = ~/Documents/multi_theme_hyprland/themes/Theme_path.conf

#source = $Theme_path/Kitty/Kitty.conf
#EOF

###
### Waybar Folder
###

###
### Wofi Folder
###

