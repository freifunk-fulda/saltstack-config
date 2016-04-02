# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# IPv4 / IPv6 firewall - SSHD rules

domain (ip ip6)
table filter
chain INPUT
proto tcp dport {{ pillar['ssh']['port'] }} {
  mod conntrack ctstate NEW
  mod recent {
    set rsource name "sshd" NOP;
    update rsource name "sshd" seconds 60 hitcount 10 rttl DROP;
  }

  ACCEPT;
}
