#!/bin/sh

if pgrep -x "xfce4-appfinder";
then
	killall xfce4-appfinder
else
	xfce4-appfinder
fi
