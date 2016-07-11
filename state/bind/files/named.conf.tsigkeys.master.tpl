# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# TSIG key for axfr

key "{{ pillar['bind']['axfr-tsig']['name'] }}" {
        algorithm {{ pillar['bind']['axfr-tsig']['algo'] }};
        secret "{{ pillar['bind']['axfr-tsig']['key'] }}";
};

