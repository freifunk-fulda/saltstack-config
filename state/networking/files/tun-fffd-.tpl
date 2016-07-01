#peer intra-as tunnels
#
auto tun-fffd-{{ gw }}
iface tun-fffd-{{ gw }} inet manual
        pre-up ip link add $IFACE type ip6gretap local {{ pillar.hosts[grains['id']].ipv6.public }} remote {{ pillar.hosts[gw].ipv6.public }}
        pre-up ip link set address de:ad:be:ef:{{ pillar.hosts[gw].id }}:{{ pillar.hosts[grains['id']].id }} dev $IFACE
        pre-up ip link set mtu 1280 dev $IFACE
        pre-up ip link set up dev $IFACE
        post-up batctl -m fffd.bat if add $IFACE
        pre-down batctl -m fffd.bat if del $IFACE
        post-down ip link del $IFACE

