#!/usr/bin/expect -f
spawn ssh root@10.20.30.40 killall midori
expect "assword:"
send "lounge\r"
interact
