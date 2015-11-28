# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# freifunk fulda - fastd configuration


# Listen on external IPv6 and IPv6 address
#
{%- if pillar['hosts'][grains['id']]['ipv4']['public'] != None %}
bind {{ pillar['hosts'][grains['id']]['ipv4']['public'] }}:10000;
{% endif -%}
{%- if pillar['hosts'][grains['id']]['ipv6']['public'] != None %}
bind [{{ pillar['hosts'][grains['id']]['ipv6']['public'] }}]:10000;
{% endif %}


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


# Interface configuration
#
interface "fffd.vpn";

on up "
  ip link set dev $INTERFACE up address {{ pillar['hosts'][grains['id']]['mac'] }}
  batctl -m fffd.bat if add $INTERFACE
";

on down "
  batctl -m fffd.bat if del $INTERFACE
  ip link set dev $INTERFACE down
";
