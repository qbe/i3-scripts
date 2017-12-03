#!/bin/bash

#props to theelitst.github.io
#provides simple control interface with VLC Media Player

if [ "$1" = "Back" ];
then
	dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 "org.mpris.MediaPlayer2.Player.Seek" int64:-500000
elif [ "$1" = "Forward" ];
then
	dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 "org.mpris.MediaPlayer2.Player.Seek" int64:500000
elif [ "$1" = "PlayPause" ];
then
	dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 "org.mpris.MediaPlayer2.Player.PlayPause"
else
	status=$( gdbus call --session --dest org.mpris.MediaPlayer2.vlc --object-path /org/mpris/MediaPlayer2 --method org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player "PlaybackStatus")
	dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 "org.mpris.MediaPlayer2.Player.$1"
	if [ "$status" != $( gdbus call --session --dest org.mpris.MediaPlayer2.vlc --object-path /org/mpris/MediaPlayer2 --method org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player "PlaybackStatus") ];
	then
		dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 "org.mpris.MediaPlayer2.Player.Pause"
	fi
fi

#vlc doesn't properly implement the mpris spec ! it resumes tracks if "previous" or "Next" are given and the track is paused ! aaaargh !
#had to bash-hack around it ._.
