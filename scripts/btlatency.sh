#!/bin/bash

BLUEZCARD=`pactl list cards short | grep ".*bluez.*" | awk '{print  $2}'`
PROFILE=`pactl list cards | grep -Pzo '.*bluez(.*\n)*' | grep -Pzo ' *Profiles:\n.*' | sed -r 's/^\w*:$//;s/^\s+(\w*):.*/\1/'`
pactl set-card-profile $BLUEZCARD off
pactl set-card-profile $BLUEZCARD $PROFILE
