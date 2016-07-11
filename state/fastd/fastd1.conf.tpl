# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# freifunk fulda - fastd configuration on port 10000

# Listen on external IPv4 and IPv6 address
#
{%- if pillar['hosts'][grains['id']]['ipv4']['public'] != None %}
bind {{ pillar['hosts'][grains['id']]['ipv4']['public'] }}:10000;
{% endif -%}
{%- if pillar['hosts'][grains['id']]['ipv6']['public'] != None %}
bind [{{ pillar['hosts'][grains['id']]['ipv6']['public'] }}]:10000;
{% endif %}


# Enable status socket
#
status socket "/var/run/fastd1.sock";


# Include global configuration
#
include "../fffd/fastd.conf";


# Interface configuration
#
interface "fffd.vpn1";

on up "
  ip link set dev $INTERFACE up address {{ pillar['hosts'][grains['id']]['mac'] }}1
  batctl -m fffd.bat if add $INTERFACE
";

on down "
  batctl -m fffd.bat if del $INTERFACE
  ip link set dev $INTERFACE down
";
