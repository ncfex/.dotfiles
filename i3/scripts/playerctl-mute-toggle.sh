#!/bin/bash

CURRENT_VOL=$(playerctl volume)

if (( $(echo "$CURRENT_VOL > 0" | bc -l) )); then
    echo $CURRENT_VOL > /tmp/playerctl_volume
    playerctl volume 0
else
    if [ -f /tmp/playerctl_volume ]; then
        STORED_VOL=$(cat /tmp/playerctl_volume)
        playerctl volume $STORED_VOL
    else
        playerctl volume 0.5
    fi
fi
