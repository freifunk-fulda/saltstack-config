# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# BATMAN Interface

allow-hotplug fffd.bat
iface fffd.bat inet6 static
        hwaddress {{ pillar['hosts'][grains['id']]['mac'] }}
        address {{ pillar['hosts'][grains['id']]['ipv6']['freifunk'] }}
        netmask 64
iface fffd.bat inet static
        address {{ pillar['hosts'][grains['id']]['ipv4']['freifunk'] }}
        netmask 255.255.192.0

