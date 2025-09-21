#!/bin/bash

positions=($(xrandr | grep ' connected' | grep -oP '\d+x\d+\+\d+\+\d+'))

unique_positions=($(printf "%s\n" "${positions[@]}" | sort -u))

if [ ${#unique_positions[@]} -eq 1 ]; then
  echo "mirror mode"
else
  echo "extend mode"
fi
