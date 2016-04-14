# THIS FILE IS CONTROLLED BY SALTSTACK

# Dummy interface for ffrl nat
#
auto {{ pillar.ffrl[grains['id']].iface.name }}
iface {{ pillar.ffrl[grains['id']].iface.name }} inet manual
    pre-up /sbin/ip link add {{ pillar.ffrl[grains['id']].iface.name }} type dummy
    up /sbin/ip link set {{ pillar.ffrl[grains['id']].iface.name }} address {{ pillar.ffrl[grains['id']].iface.mac }}
    address {{ pillar.ffrl[grains['id']].ipv4.address }}
    netmask {{ pillar.ffrl[grains['id']].ipv4.mask }}

iface {{ pillar.ffrl[grains['id']].iface.name }} inet6 manual
    address {{ pillar.ffrl[grains['id']].ipv6.network }}
    mask {{ pillar.ffrl[grains['id']].ipv6.mask }}
