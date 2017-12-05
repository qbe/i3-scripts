#!/bin/bash

pactl set-source-mute 1 1
#mute the microphone

val=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
#save the screen brightness for restoring

echo 2 > /sys/class/backlight/intel_backlight/brightness
#set the screen brightness to almost off

i3lock -n
#blocking screenlock

echo "$val" > /sys/class/backlight/intel_backlight/brightness
#restore the screen brightness to the saved value


#replace every occurence of intel_backlight with nv_backlight for discrete graphics setup
