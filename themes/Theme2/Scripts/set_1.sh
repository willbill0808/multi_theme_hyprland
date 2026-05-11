#!/bin/bash

touch ~/.config/hypr/hyprlock.conf
cat <<EOF > ~/Documents/multi_theme_hyprland/themes/theme.json
{
  "theme": "Theme1"
}
EOF

/home/will-main/Documents/multi_theme_hyprland/scripts/set_hypr.sh 