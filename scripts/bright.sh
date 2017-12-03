#!/bin/bash
cat /sys/class/backlight/intel_backlight/max_brightness > /sys/class/backlight/intel_backlight/brightness
#replace intel_backlight with nv_backlight for discrete graphics setup
