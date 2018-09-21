#!/usr/bin/expect -f
spawn ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@10.20.30.40 killall midori
expect "assword:"
send "lounge\r"
interact

#uses expect to send the browser kill command via ssh
