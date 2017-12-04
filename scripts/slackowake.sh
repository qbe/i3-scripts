#!/bin/bash
wget --header="User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11" \
--header="Accept-Encoding: compress, gzip" http://10.20.30.90:8080/slackomatic/rooms/lounge/powersaving/killswitch/reset -o /dev/null
exec "$HOME/.config/i3/midorikill.sh" > /dev/null
