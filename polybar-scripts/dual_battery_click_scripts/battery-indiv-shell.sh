#!/bin/sh

path_ac="/sys/class/power_supply/AC"
path_battery_0="/sys/class/power_supply/BAT0"
path_battery_1="/sys/class/power_supply/BAT1"

ac=0
battery_percent_0=$(cat "$path_battery_0/capacity")
battery_percent_1=$(cat "$path_battery_1/capacity")

if [ -f "$path_ac/online" ]; then
    ac=$(cat "$path_ac/online")
fi

if [ "$ac" -eq 1 ]; then
    icon_0=""

    if [ "$battery_percent_0" -gt 97 ]; then
        output="$icon_0 "
    else
        output="$icon_0 $battery_percent_0%"
    fi

    if [ "$battery_percent_1" -gt 97 ]; then
        output="$output $icon_1 "
    else
        output="$output $icon_1 $battery_percent_1%"
    fi

else
    if [ "$battery_percent_0" -gt 85 ]; then
        icon_0=""
    elif [ "$battery_percent_0" -gt 60 ]; then
        icon_0=""
    elif [ "$battery_percent_0" -gt 35 ]; then
        icon_0=""
    elif [ "$battery_percent_0" -gt 10 ]; then
        icon_0=""
    else
        icon_0=""
    fi

    if [ "$battery_percent_1" -gt 85 ]; then
        icon_1=""
    elif [ "$battery_percent_1" -gt 60 ]; then
        icon_1=""
    elif [ "$battery_percent_1" -gt 35 ]; then
        icon_1=""
    elif [ "$battery_percent_1" -gt 10 ]; then
        icon_1=""
    else
        icon_1=""
    fi

    output="$icon_0 $battery_percent_0% $icon_1 $battery_percent_1%"
fi

echo $output > ~/polybar-scripts/battery-output.txt
