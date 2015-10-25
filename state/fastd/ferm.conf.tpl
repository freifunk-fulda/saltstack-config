# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# IPv4 / IPv6 firewall - fastd rules

domain (ip ip6)
table filter
chain INPUT
proto udp dport (10000 10001) ACCEPT;

