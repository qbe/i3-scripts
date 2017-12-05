#!/bin/bash

pactl set-source-mute 1 1
#mutes the microphone

status=$( gdbus call --session --dest org.mpris.MediaPlayer2.vlc --object-path \
/org/mpris/MediaPlayer2 --method org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player "PlaybackStatus")
#uses dbus to save the current vlc media player status

dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.vlc \
/org/mpris/MediaPlayer2 "org.mpris.MediaPlayer2.Player.Pause"
#pauses vlc media player via dbus

/bin/lockscreen
#calls the main screen locking programm

if [ "$status" != $( gdbus call --session --dest org.mpris.MediaPlayer2.vlc --object-path \
/org/mpris/MediaPlayer2 --method org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player "PlaybackStatus") ];
then
	dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.vlc \
	/org/mpris/MediaPlayer2 "org.mpris.MediaPlayer2.Player.PlayPause"
fi
#if the state was changed by the above pausing of vlc media player, start it again via dbus
