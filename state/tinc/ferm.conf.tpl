# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# IPv4 / IPv6 firewall - tinc rules

domain (ip ip6)
table filter {
  chain INPUT {
    proto (tcp udp) dport {{ pillar['tinc']['port'] }} ACCEPT;
  }
}

