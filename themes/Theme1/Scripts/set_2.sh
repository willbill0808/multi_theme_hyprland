#!/bin/bash


touch ~/Documents/multi_theme_hyprland/themes/theme.json
cat <<EOF > ~/Documents/multi_theme_hyprland/themes/theme.json
{
  "theme": "Theme2"
}
EOF

/home/will-main/Documents/multi_theme_hyprland/scripts/set_hypr.sh 