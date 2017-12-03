#!/bin/bash
pactl set-source-mute 1 1
status=$( gdbus call --session --dest org.mpris.MediaPlayer2.vlc --object-path /org/mpris/MediaPlayer2 --method org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player "PlaybackStatus")
dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 "org.mpris.MediaPlayer2.Player.Pause"
/bin/lockscreen
if [ "$status" != $( gdbus call --session --dest org.mpris.MediaPlayer2.vlc --object-path /org/mpris/MediaPlayer2 --method org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player "PlaybackStatus") ];
then
	dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 "org.mpris.MediaPlayer2.Player.PlayPause"
fi
