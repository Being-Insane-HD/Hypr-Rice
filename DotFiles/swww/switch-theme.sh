#!/bin/bash

# Path to store the state of the last used theme
STATE_FILE="$HOME/.cache/last_swww_theme"

# Full paths to theme scripts
THEME1_SCRIPT="$HOME/.config/swww/theme1/swww-wall1.sh"
THEME2_SCRIPT="$HOME/.config/swww/theme2/swww-wall2.sh"

# Read last used theme
if [ -f "$STATE_FILE" ]; then
    LAST_THEME=$(<"$STATE_FILE")
else
    LAST_THEME="theme2"  # So theme1 runs first
fi

# Toggle and run
if [ "$LAST_THEME" == "theme1" ]; then
    exec "$THEME1_SCRIPT"
else
    exec "$THEME2_SCRIPT"
fi
