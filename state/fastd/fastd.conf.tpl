# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# freifunk fulda - fastd global configuration


# MTU to use (needs to be the same on all peers)
# (maximum should be 1492 - IPv6 header - fastd header)
mtu {{ pillar['fastd'][grains['id']]['mtu'] }};


# Authentication / Encryption method to use
#
{% for method in pillar['fastd'][grains['id']]['methods'] -%}
method "{{ method }}";
{% endfor %}


# logging
#
{% if pillar['hosts'][grains['id']]['debug'] -%}
log to syslog level debug;
{% else -%}
log to syslog level verbose;
{% endif %}
hide ip addresses yes;
hide mac addresses yes;


# Our own secret key
#
secret "{{ pillar['fastd'][grains['id']]['secret']}}";


# Include peers
#
include peers from "fffd-peers-backbone";
include peers from "fffd-peers-nodes";

