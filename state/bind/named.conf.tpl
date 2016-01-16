# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# bind9 configuration

include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
{% if pillar.peerings[grains['id']].type == "icvpn" -%}
include "/etc/bind/named.conf.icvpn";
{% endif -%}
include "/etc/bind/named.conf.default-zones";
include "/etc/bind/named.conf.tsigkeys";
