# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# BATMAN Interface
{% if 'kvm' in grains['roles'] %}
allow-hotplug fffd.bat
iface fffd.bat inet manual

auto fffd.br
iface fffd.br inet6 static
        hwaddress {{ pillar['hosts'][grains['id']]['mac'] }}
        address {{ pillar['hosts'][grains['id']]['ipv6']['freifunk'] }}
        netmask 64
iface fffd.br inet static
        address {{ pillar['hosts'][grains['id']]['ipv4']['freifunk'] }}
        netmask 255.255.192.0
        bridge_ports fffd.bat
        bridge_maxwait 0
{%- else %}
allow-hotplug fffd.bat
iface fffd.bat inet6 static
        hwaddress {{ pillar['hosts'][grains['id']]['mac'] }}
        address {{ pillar['hosts'][grains['id']]['ipv6']['freifunk'] }}
        netmask 64
        post-up /sbin/ip addr add dev fffd.bat {{ pillar.ffrl.ipv6.network }}{{ pillar.hosts[grains.id].id }}/{{ pillar.ffrl.ipv6.netmask }}
iface fffd.bat inet static
        address {{ pillar['hosts'][grains['id']]['ipv4']['freifunk'] }}
        netmask 255.255.192.0
{%- endif %}
