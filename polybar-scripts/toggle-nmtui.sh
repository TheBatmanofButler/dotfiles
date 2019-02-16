#!/bin/sh

if pgrep -x "nmtui";
then
	killall nmtui
else
    xfce4-terminal -e nmtui
fi
