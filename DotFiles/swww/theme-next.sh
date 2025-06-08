#!/bin/bash

STATE_FILE="$HOME/.cache/last_swww_theme"

if [ -f "$STATE_FILE" ]; then
    LAST_THEME=$(<"$STATE_FILE")
else
    LAST_THEME="theme2"  # So theme1 runs first
fi

if [ "$LAST_THEME" == "theme1" ]; then
    echo "theme2" > "$STATE_FILE"
else
    echo "theme1" > "$STATE_FILE"
fi