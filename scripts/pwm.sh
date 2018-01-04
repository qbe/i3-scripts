#!/bin/bash
activeid=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
#get the id of the currently active x window

activetitle=$( xprop -id "$activeid" | awk '/WM_NAME/{$1=$2="";print}' | cut -d '"' -f2 | head --lines=1 )
#get the window title of the currently active x window

activehash=$( echo "$activetitle""$(pass show auto secret)" | sha256sum | sed 's/ -//g;')
#get the sha256-hash of the currently active x window title and appended to it the common auto/secret

echo "$activeid"
echo "$activetitle"
echo "$activehash"

#TODO:
# check if resource is there
# if not, create it (use dmenu to query for the required fields)
#
# launch pass in a floating terminal window to query for the master password,
# get password and username etc out of password file (by hash)
# insert data into the previously active window

#xdotool type --window "$activeid"
