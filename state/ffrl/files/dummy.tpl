# THIS FILE IS CONTROLLED BY SALTSTACK

# Dummy interface for ffrl routing
#
auto {{ pillar.ffrl.iface }}
iface {{ pillar.ffrl.iface }} inet manual
    up /sbin/ip link add dev {{ pillar.ffrl.iface }} type dummy
    up /sbin/ip link set dev {{ pillar.ffrl.iface }} address {{ pillar.ffrl[grains['id']].mac }}
    up /sbin/ip link set dev {{ pillar.ffrl.iface }} up
    up /sbin/ip addr add dev {{ pillar.ffrl.iface }} {{ pillar.ffrl[grains['id']].ipv4.address }}/{{ pillar.ffrl[grains['id']].ipv4.mask }}
    down /sbin/ip link del dev {{ pillar.ffrl.iface }}

