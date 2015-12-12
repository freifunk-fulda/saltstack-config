# Peering configuration
# We allow peering in icvpn using bgp over tinc (type: icvpn) or
# the new and improved icevpn using bgp over gre/ip6gre (type: ice)

peerings:
  gw01:
    type: icvpn

  gw02:
    type: none
    peers:
      ffda:
        as: 65038
        proto: ip6gre
        ttl: 128
        mtu: 1400
        remote: fe80:42:42:42::
        tun4:
          mask: 255.255.255.252
          left: 172.16.185.1
          right: 172.16.185.2
        tun6:
          mask: 64
          left: fe80:23:23:23::1
          right: fe80:23:23:23::2

  gw03:
    type: icvpn
