#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR2="$HOME/Drive_Turbo/Wallpaper/desktop/theme2"
HISTORY_FILE="$HOME/Drive_Turbo/Wallpaper/.last_wallpaper"

# Get the list of wallpapers sorted alphabetically
WALLPAPERS=($(find "$WALLPAPER_DIR2" -type f | sort))

# Check if wallpapers exist
if [[ ${#WALLPAPERS[@]} -eq 0 ]]; then
    echo "No wallpapers found in $WALLPAPER_DIR2"
    exit 1
fi

# Read the last used wallpaper from history
if [[ -f "$HISTORY_FILE" ]]; then
    LAST_WALL=$(cat "$HISTORY_FILE")
else
    LAST_WALL=""
fi

# Find the index of the last used wallpaper
NEXT_INDEX=0
for i in "${!WALLPAPERS[@]}"; do
    if [[ "${WALLPAPERS[$i]}" == "$LAST_WALL" ]]; then
        NEXT_INDEX=$((i + 1))
        break
    fi
done

# Loop back to the first wallpaper if we reached the end
if [[ $NEXT_INDEX -ge ${#WALLPAPERS[@]} ]]; then
    NEXT_INDEX=0
fi

# Get the next wallpaper
WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"

# Save the selected wallpaper for next time
echo "$WALLPAPER" > "$HISTORY_FILE"

# Apply the wallpaper using Hyprpaper
# hyprctl hyprpaper preload "$WALLPAPER"
# hyprctl hyprpaper wallpaper " ,$WALLPAPER"

# Uncomment below if using `swww` for smooth transitions
swww img "$WALLPAPER" --transition-pos top-left --transition-fps 60 --transition-type grow --transition-duration 3