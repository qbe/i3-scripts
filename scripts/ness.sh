#!/bin/bash
echo -e "500\n1000\n1200" | dmenu -p $(cat /sys/class/backlight/intel_backlight/actual_brightness) \
> /sys/class/backlight/intel_backlight/brightness

#use dmenu to ask the user for a new brighntess value,
#with the prompt being the current brightnes value
#set the screen brightness to the new value

#replace every occurrence of intel_backlight with nv_backlight for discrete graphics setup
