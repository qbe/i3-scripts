#!/bin/bash

systemctl "$(dmenu -p 'sysaction:' -nb \#500005 -nf \#666666 -sb \#AA000A -sf \#EEEEEE <<- 'EOF'
	halt
	poweroff
	reboot
	suspend
	hibernate
	hybrid-sleep
	EOF
)"
