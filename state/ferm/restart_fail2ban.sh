#!/bin/bash

/etc/init.d/fail2ban stop &>/dev/null

test -f /var/run/fail2ban/fail2ban.sock
if [ $? -eq 0 ]; then
	rm /var/run/fail2ban/fail2ban.sock
fi

/etc/init.d/fail2ban start &>/dev/null
