#!/bin/bash
theme=$(jq -r '.theme' "$HOME/Documents/multi_theme_hyprland/themes/theme.json")

cp -r ~/Documents/multi_theme_hyprland/themes/$theme/waybar ~/.config/

killall -9 waybar

waybar & 