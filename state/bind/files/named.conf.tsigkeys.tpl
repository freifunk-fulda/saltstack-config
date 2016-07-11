# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# tsig keys used for axfr

key "{{ pillar['bind']['axfr-tsig']['name'] }}" {
	algorithm {{ pillar['bind']['axfr-tsig']['algo'] }};
	secret "{{ pillar['bind']['axfr-tsig']['key'] }}";
};

server {{ pillar['bind']['master']['ipv4'] }} {
 keys { {{ pillar['bind']['axfr-tsig']['name'] }}; };
};

server {{ pillar['bind']['master']['ipv6'] }} {
 keys { {{ pillar['bind']['axfr-tsig']['name'] }}; };
};

