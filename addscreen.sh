#!/bin/bash

#default display to ADD is VGA1. if everything fails, it tries to add LVDS1
display="LVDS1"

#display is set to a list of connected displays which are not used
xrandr --setprovideroutputsource nouveau Intel && display=$(xrandr | grep " connected" | grep -v "mm x " | awk '{print $1}')

#if the list of displays that are connected but not in use is more than one element long,
#launch a dmenu bar to select which entry to keep in the list
if (( $(grep -o "1" <<< "$display" | wc -l) /> 1 ));
then
	display=$(echo -e "$display" | dmenu -p "add:");
fi

#If the display to add is not LVDS1, add it in relation to LVDS1 according to the first argument
#If the display to add is LVDS1, ask via dmenu in relation to which display the adding shall occur
if [ "$display" == "LVDS1" ];
then
	xrandr --output "$display" --auto --$1 $(xrandr | grep "mm x " | awk '{print $1}' | dmenu -p $1":")
else
	xrandr --output "$display" --auto --$1 LVDS1
fi

#debug stuff

#echo -e "$display"
#source ~/.xprofile
