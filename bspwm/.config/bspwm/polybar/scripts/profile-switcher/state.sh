#!/bin/bash

# Set up the state variable
STATE=$(asusctl profile -p | grep "Active" | awk '{print $NF}')

# Run commands based on the value of STATE variable
if [ "$STATE" = "Performance" ]; then
    echo 󰡴 
elif [ "$STATE" = "Balanced" ]; then
    echo 󰡵 
elif [ "$STATE" = "Quiet" ]; then
    echo 󰡳 
fi
