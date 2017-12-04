# i3-scripts

A number of scripts, initially written to extend the functionality
of the i3 window manager

* config: configuration file for the i3 window manager and therefore entry point for the scripts
* ffserver.conf: configuration file for ffmpeg stream server for audio sharing

* addscreen.sh: add screenspace using xrandr, invoke with one of {left-of, right-of, abovr, below, same-as}
* delscreen.sh: remove screenspace using xrandr and dmenu

* bright.sh: set the screen brightness to the maximum value
* dark.sh: set the screen brightness to a very dark value
* ness.sh: use dmenu to ask the user for a screen brightness value

* i3lockscreen.sh: save the screen brightness, lock the screen with i3lock, restore the screen brightness
* usrlockscreen.sh: pauses vlc media player, invokes /bin/lockscreen, restores previous vlc media player status
* lockscreen: exits if another instance is running, saves the screen bightness, blanks all screens with i3lock in another process (saving the process id), locks all ttys using physlock, kills the i3lock process, restores the brightness

* vlckeys.sh: sends commands to vlc media player using dbus, invoke with one of {Back,Forward,PlayPause, ...}

* slackowake.sh: sends a http get request to the SlackoMatic at METALAB, invokes midorikill.sh
* midorikill.sh: uses expect and ssh to kill the midori browser on the ScreenInvader at METALAB

* sysmenu.sh: uses dmenu to ask the user for a systemctl command to execute

* screenshot.sh: uses import to take a screenshot, invoke with -window to get a full screen capture

* swrapper.sh: advanced features for the i3bar, including currently playing vlc media element, and network speed

* pwm.sh: password manager utiliy using pass
