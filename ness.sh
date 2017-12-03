#!/bin/bash
echo -e "500\n1000" | dmenu > /sys/class/backlight/intel_backlight/brightness
#replace intel_backlight with nv_backlight for discrete graphics setup
