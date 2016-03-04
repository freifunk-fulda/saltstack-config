# THIS FILOE IS CONTROLLED BY SALTSTACK!
#
# Freifunk Fulda DHCP Configuration
#
# Network:      10.185.  0.0/16 
# Subnetting:   10.185.  0.0/18 (DHCP: 10.185.  1.0 - 10.185. 63.254)
#               10.185. 64.0/18 (unused)
#               10.185.128.0/18 (unused)
#               10.185.192.0/18 (unused)
#
# DHCP ranges:
#  gw01:        10.185.10.0 - 10.185. 19.255
#  gw02:        10.185.20.0 - 10.185. 29.255
#  gw03:        10.185.30.0 - 10.185. 39.255
#
# Static IPs:   10.185. 1.0 - 10.185.  9.255
#  
# Note: Addresses in the range 10.185.0.0 - 10.185.0.255 are reserved
#       for infrastructure services!
#

# The ddns-updates-style parameter controls whether or not the server will
# attempt to do a DNS update when a lease is confirmed. We default to the
# behavior of the version 2 packages ('none', since DHCP v2 didn't
# have support for DDNS.)
ddns-update-style none;

# our domain name
option domain-name "fffd.eu";

# lease time parameters
default-lease-time 600;
max-lease-time 3600;

# Use facility local7 and send dhcp log messages to a different log file 
log-facility local7;

# Freifunk Fulda subnet
subnet 10.185.0.0 netmask 255.255.192.0 {
        authoritative;
        range 10.185.{{ pillar['hosts'][grains['id']]['id'] }}0.0 10.185.{{ pillar['hosts'][grains['id']]['id'] }}9.255;
        option routers 10.185.0.{{ pillar['hosts'][grains['id']]['id'] }};
        option domain-name-servers 10.185.0.{{ pillar['hosts'][grains['id']]['id'] }}{% for host in pillar['hosts'].keys() if host != grains['id'] and host.startswith('gw') and pillar['hosts'][host]['enabled'] -%}, 10.185.0.{{ pillar['hosts'][host]['id'] }}{% endfor -%};
        option ntp-servers ntp{{ pillar['hosts'][grains['id']]['id'] }}.services.fffd.eu{% for host in pillar['hosts'].keys() if host != grains['id'] and host.startswith('gw') and pillar['hosts'][host]['enabled'] -%}, ntp{{ pillar['hosts'][host]['id'] }}.services.fffd.eu{% endfor -%};

        # static DHCP
        include "/var/cache/dhcp/dhcpd.static.conf";
}

