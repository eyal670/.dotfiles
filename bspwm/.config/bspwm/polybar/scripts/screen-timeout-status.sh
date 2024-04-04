#!/bin/bash

# Set up the state variable
STATE=$(xset q | grep "DPMS is" | awk '{print $3}')

# Run commands based on the value of STATE variable
if [ "$STATE" = "Enabled" ]; then
    echo  
elif [ "$STATE" = "Disabled" ]; then
    echo  !
fi
