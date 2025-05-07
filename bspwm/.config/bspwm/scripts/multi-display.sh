#!/bin/bash

notify-send "config multi-display"

# Get connected screens
SCREENS=($(xrandr --query | grep " connected" | awk '{print $1}'))

# Identify HDMI and internal laptop display
PRIMARY=""
INTERNAL_DISPLAY=""

for SCREEN in "${SCREENS[@]}"; do
    if [[ $SCREEN == HDMI* ]]; then
        PRIMARY=$SCREEN
        break  # Prioritize HDMI
    elif [[ $SCREEN == eDP* || $SCREEN == LVDS* ]]; then
        INTERNAL_DISPLAY=$SCREEN  # Store internal display
    fi
done

# If no HDMI is found, use the internal laptop display
if [[ -z "$PRIMARY" && -n "$INTERNAL_DISPLAY" ]]; then
    PRIMARY=$INTERNAL_DISPLAY
fi

# If neither HDMI nor internal display is found, fallback to the first available screen
if [[ -z "$PRIMARY" ]]; then
    PRIMARY=${SCREENS[0]}
fi

# Set the selected primary display
xrandr --output $PRIMARY --auto --primary

# Arrange other screens to the right of the primary display
PREV=$PRIMARY
for SCREEN in "${SCREENS[@]}"; do
    if [[ $SCREEN != $PRIMARY ]]; then
        xrandr --output $SCREEN --auto --right-of $PREV
        PREV=$SCREEN
    fi
done
