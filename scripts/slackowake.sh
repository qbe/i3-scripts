#!/bin/bash
wget --header="User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11" \
--header="Accept-Encoding: compress, gzip" http://10.20.30.90:8080/slackomatic/rooms/lounge/powersaving/killswitch/reset --output-document=/dev/null

#sends browserly-looking get-request to the slackomatic

#sleep 2

#  exec "$HOME/.config/i3/midorikill.sh" > /dev/null
#the expect line used to be its own script

expect -c "spawn ssh root@10.20.30.40; expect -re \".*assword: \"; send lounge\\r; expect -re \".*~\# \"; send \"killall midori\\r\"; send \"sleep 0.5\\r\"; send \"killall midori\\r\"; send \"sleep 0.5\\r\"; send \"killall midori\\r\"; send \"logout\\r\"; expect eof"
#uses expect to send the browser kill command via ssh


#kills the midori browser on the screeninvader
