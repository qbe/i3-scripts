#!/bin/bash
pactl set-source-mute 1 1
val=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
echo 2 > /sys/class/backlight/intel_backlight/brightness
i3lock -n
echo "$val" > /sys/class/backlight/intel_backlight/brightness
#replace intel_backlight with nv_backlight for discrete graphics setup
