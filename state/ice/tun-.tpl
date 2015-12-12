# THIS FILE IS CONTROLLED BY SALTSTACK!

# Interface for ICE peering with {{ peer }}
#
auto tun-{{ peer }}
iface tun-{{ peer }} inet static
	address {{ pillar.peerings[grains['id']].peers[peer].tun4.left }}
	netmask {{ pillar.peerings[grains['id']].peers[peer].tun4.mask }}
	{% if pillar.peerings[grains['id']].peers[peer].proto == "ip6gre" %}
	pre-up ip -6 tunnel add tun-{{ peer }} mode ip6gre remote {{ pillar.peerings[grains['id']].peers[peer].remote }} local {{ pillar.hosts[grains['id']].ipv6.public }} ttl {{ pillar.peerings[grains['id']].peers[peer].ttl }}
	{% elif  pillar.peerings[grains['id']].peers[peer].proto == "gre" %}
	pre-up ip -4 tunnel add tun-{{ peer }} mode gre remote {{ pillar.peerings[grains['id']].peers[peer].remote }} local {{ pillar.hosts[grains['id']].ipv4.public }} ttl {{ pillar.peerings[grains['id']].peers[peer].ttl }}
	{% endif %}
	up ip link set mtu {{ pillar.peerings[grains['id']].peers[peer].mtu }} dev tun-{{ peer }}
	post-down ip tunnel del tun-{{ peer }}

iface tun-{{ peer }} inet6 static
	address {{ pillar.peerings[grains['id']].peers[peer].tun6.left }}
	netmask {{ pillar.peerings[grains['id']].peers[peer].tun6.mask }}
