#!/bin/bash

###
### HYPR Folder
###

theme=$(jq -r '.theme' "$HOME/Documents/multi_theme_hyprland/themes/theme.json")
WALLPAPER_DIR="$HOME/Documents/multi_theme_hyprland/themes/$theme/Wallpapers" # Change this to your wallpaper directory

mkdir -p ~/.config/hypr

touch ~/.config/hypr/hyprland.conf
cat <<EOF > ~/.config/hypr/hyprland.conf
\$theme = $theme
\$mult = ~/Documents/multi_theme_hyprland

source = $HOME/Documents/multi_theme_hyprland/themes/$theme/Hypr/hyprland.conf
EOF

touch ~/.config/hypr/hyprlock.conf
cat <<EOF > ~/.config/hypr/hyprlock.conf
\$theme = $theme

source = $HOME/Documents/multi_theme_hyprland/themes/$theme/Hypr/hyprlock.conf
EOF

# Select a random wallpaper from the directory
original_path=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)

# Ensure a valid wallpaper was found before proceeding
if [ -n "$original_path" ]; then
    # Set wallpaper using swww with the original file
    awww img "$original_path"

    # Save the selection for persistence
    echo "$original_path" > "$HOME/.cache/current_wallpaper"

    # Optional: Notify user
    notify-send "Wallpaper" "Wallpaper has been updated" -i "$original_path"
else
    notify-send "Wallpaper Error" "Could not find the original wallpaper file."
fi

echo "reloading"

/home/will-main/Documents/multi_theme_hyprland/scripts/launch_waybar.sh
hyprctl reload

#untested lua ver
#cat <<EOF > ~/.config/hypr/hyprland.conf
#local json = require("dkjson")

#local file = io.open(os.getenv("HOME") .. "/Documents/multi_theme_hyprland/themes/theme.json", "r")
#local content = file:read("*a")
#file:close()

#local data = json.decode(content)

#local theme = data.theme

#hyprland.source(
#    os.getenv("HOME") ..
#    "/Documents/multi_theme_hyprland/themes/" ..
#    theme ..
#    "/hypr/hyprland.conf"
#)
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

