#!/bin/sh

state=$(head -n 2 ~/polybar-scripts/battery-info.txt | tail -1)

if [ "$state" -eq "0" ]; then
    state=1
    source ~/polybar-scripts/battery-combined-shell.sh
else
    state=0
    source ~/polybar-scripts/battery-indiv-shell.sh
fi

sed -i "2s/.*/$state/" ~/polybar-scripts/battery-info.txt