#!/usr/bin/env bash
# Configuration
theme=$(jq -r '.theme' "$HOME/Documents/multi_theme_hyprland/themes/theme.json")
THEME_DIR="$HOME/Documents/multi_theme_hyprland/themes" 
CACHE_DIR="$HOME/.cache/theme-selector"
THUMBNAIL_WIDTH="250"  # Size of thumbnails in pixels (16:9)
THUMBNAIL_HEIGHT="141"

# Create cache directory if it doesn't exist
mkdir -p "$CACHE_DIR"

# Function to generate thumbnail
generate_thumbnail() {
    local input="$1"
    local output="$2"
    magick "$input" -thumbnail "${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}^" -gravity center -extent "${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}" "$output"
}

# Create shuffle icon thumbnail on the fly
SHUFFLE_ICON="$CACHE_DIR/shuffle.png"
# Create a properly sized shuffle icon thumbnail
magick -size "${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}" xc:#1e1e2e \
    \( "$HOME/Documents/multi_theme_hyprland/other/shuffle.png" -resize "80x80" \) \
    -gravity center -composite "$SHUFFLE_ICON"

# Generate thumbnails and create menu items
generate_menu() {
    # Add random/shuffle option
    echo -en "img:$SHUFFLE_ICON\x00info:!Random Wallpaper\x1fRANDOM\n"

    # Find all images inside */isplay/ directories
    find "$THEME_DIR" -type f \
        \( -path "*/Display/*.jpg" \
        -o -path "*/Display/*.jpeg" \
        -o -path "*/Display/*.png" \
        -o -path "*/Display/*.webp" \) | while read -r img; do

        # Generate thumbnail filename
        thumbnail="$CACHE_DIR/$(basename "${img%.*}").png"

        # Generate thumbnail if needed
        if [[ ! -f "$thumbnail" ]] || [[ "$img" -nt "$thumbnail" ]]; then
            generate_thumbnail "$img" "$thumbnail"
        fi

        # Output menu item
        echo -en "img:$thumbnail\x00info:$(basename "$img")\x1f$img\n"
    done
}

# Use wofi to display grid of wallpapers - IMPORTANT: added --sort-order=default
selected=$(generate_menu | wofi --show dmenu \
    --cache-file /dev/null \
    --define "image-size=${THUMBNAIL_WIDTH}x${THUMBNAIL_HEIGHT}" \
    --columns 3 \
    --allow-images \
    --insensitive \
    --sort-order=default \
    --prompt "Select Wallpaper" \
    --conf ~/Documents/multi_theme_hyprland/themes/$theme/wofi/wallpaper.conf \
    --style ~/Documents/multi_theme_hyprland/themes/$theme/wofi/wallpaper.css \
)

# Set theme if one was selected
if [ -n "$selected" ]; then
    # Remove the img: prefix to get the cached thumbnail path
    theme="${selected#img:}"

    theme_name="$(basename "${theme%.*}")"

    if [[ "$theme_name" == "shuffle" ]]; then
        themes=( "$HOME/Documents/multi_theme_hyprland/themes"/*/ )

        theme_name="$(basename "${themes[RANDOM % ${#themes[@]}]}")"
    fi
    echo $theme_name

    touch ~/Documents/multi_theme_hyprland/themes/theme.json
    cat <<EOF > ~/Documents/multi_theme_hyprland/themes/theme.json
{
"theme": "$theme_name"
}
EOF
    /home/will-main/Documents/multi_theme_hyprland/scripts/set_hypr.sh 
    notify-send "Theme" "Theme has been updated" -i "$theme_name"
fi

