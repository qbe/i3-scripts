#!/bin/bash
id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')

xdotool type --window "$id" $(xprop -id "$id" | awk '/WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
