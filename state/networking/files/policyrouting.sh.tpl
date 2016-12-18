#!/bin/sh

# Welcome to our main routing rule configuration. This script gets executed
# by systemd unit policyrouting.service. It will add or delete ip rules.

# We need exactly one argument ("start" or "stop")
#
if [ $# -ne 1 ]; then
  exit 1
fi

# Depending on the argument, we add or delete rules
#
if [ "$1" = "start" ]; then
  TYPE='add'
else
  TYPE='del'
fi


# all traffic will lookup table private, where routes for IC-VPN, dn42
# and our own network are located. at the end of this table any rfc1918
# traffic hits an unreachable route, to prevent this type of traffic to
# leave freifunk/icvpn/dn42 networks
#
/sbin/ip -4 rule ${TYPE} prio 100 table private
/sbin/ip -6 rule ${TYPE} prio 100 table private


# for traffic from our own network, which is not destined to an rfc1918
# destination, we lookup table internet
#
/sbin/ip -4 rule ${TYPE} prio 110 from 10.185.0.0/16 table internet
/sbin/ip -6 rule ${TYPE} prio 110 from 2a03:2260:100f:0100::/56 table internet

# traffic originated from the uplink nat interfaces should be routed to the internet
#
/sbin/ip -4 rule ${TYPE} prio 111 from {{ pillar.ffrl[grains.id].ipv4.address}}/{{ pillar.ffrl[grains.id].ipv4.mask }} table internet

# finally, everything except local traffic will hit the sink table with
# an unreachable default route, instead of looking up main table
#
/sbin/ip -4 rule ${TYPE} prio 190 iif fffd.bat table sink
/sbin/ip -6 rule ${TYPE} prio 190 iif fffd.bat table sink

/sbin/ip -4 rule ${TYPE} prio 190 iif fffd.vpn1 table sink
/sbin/ip -6 rule ${TYPE} prio 190 iif fffd.vpn1 table sink

/sbin/ip -4 rule ${TYPE} prio 190 iif fffd.vpn2 table sink
/sbin/ip -6 rule ${TYPE} prio 190 iif fffd.vpn2 table sink

{% if pillar.peerings[grains['id']].type == "icvpn" -%}
/sbin/ip -4 rule ${TYPE} prio 190 iif icvpn table sink
/sbin/ip -6 rule ${TYPE} prio 190 iif icvpn table sink
{% elif pillar.peerings[grains['id']].type == "ice" -%}
{% for peer, values in pillar.peerings[grains['id']].peers.iteritems() %}
/sbin/ip -4 rule ${TYPE} prio 190 iif tun-{{peer}} table sink
/sbin/ip -6 rule ${TYPE} prio 190 iif tun-{{peer}} table sink
{% endfor %}
{% endif %}

{% for key in pillar.ffrl.peers.endpoints.keys() %}
/sbin/ip -4 rule ${TYPE} prio 190 iif tun-{{key}} table sink
/sbin/ip -6 rule ${TYPE} prio 190 iif tun-{{key}} table sink
{% endfor %}
