# THIS FILE IS CONTROLLED BY SALTSTACK!

# Interface for ffrl peering with {{ peer }}
#
auto tun-{{ peer }}

iface tun-{{ peer }} inet static
	address {{ pillar.ffrl[grains['id']].peers[peer].tun4.self }}
	netmask {{ pillar.ffrl[grains['id']].peers[peer].tun4.mask }}
	pre-up ip -4 tunnel add tun-{{ peer }} mode gre remote {{ pillar.ffrl[grains['id']].peers[peer].endpoint }} local {{ pillar.hosts[grains['id']].ipv4.public }} ttl 64
	up ip link set mtu 1400 dev tun-{{ peer }}
	post-down ip tunnel del tun-{{ peer }}

iface tun-{{ peer }} inet6 static
	address {{ pillar.ffrl[grains['id']].peers[peer].tun6.self }}
	netmask {{ pillar.ffrl[grains['id']].peers[peer].tun6.mask }}
