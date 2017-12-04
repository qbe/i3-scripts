#!/bin/bash
active=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')

xprop -id "$active" | awk '/WM_NAME/{$1=$2="";print}' | cut -d '"' -f2 | head --lines=1
xprop -id "$active" | awk '/WM_NAME/{$1=$2="";print}' | cut -d '"' -f2 | head --lines=1 | sha256sum | sed 's/ -//g;'

#xdotool type --window "$active"
