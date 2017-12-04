#!/bin/bash

display="VGA1"

xrandr --setprovideroutputsource nouveau Intel && display=$(xrandr | grep "mm x " | awk '{print $1}')

if (($(grep -o "1" <<< "$display" | wc -l) > 1 ));
then
	display=$(echo -e "$display" | dmenu -p "del:");
	xrandr --output $display --off;
fi
