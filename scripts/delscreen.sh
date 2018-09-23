#!/bin/bash

display="VGA1"
#default display to add is VGA1

xrandr --setprovideroutputsource nouveau Intel && display="$(xrandr | grep 'mm x ' | awk '{print $1}')"
#set the display variable to a list of used displays


if (($(grep -o "1" <<< "$display" | wc -l) > 1 ));
then
	display="$(echo -e "$display" | dmenu -p del: )"
	xrandr --output "$display" --off;
fi

#if the list of used displays is 1 or less, do nothing
#otherwise, use dmenu to select which display to delete, delete it via xrandr 
