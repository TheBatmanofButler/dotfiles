#!/usr/bin/env bash

while true
do
    state=$(head -n 2 ~/polybar-scripts/battery-info.txt | tail -1)

    if [ "$state" -eq "0" ]; then
        source ~/polybar-scripts/battery-combined-shell.sh
    else
        source ~/polybar-scripts/battery-indiv-shell.sh
    fi
    sleep 1
done