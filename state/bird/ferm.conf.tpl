# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# IPv4 / IPv6 firewall - tinc rules

domain (ip ip6)
table filter {
  chain INPUT {
    # Allow bgp traffic between our gateways
    interface fffd.bat {
      {% for host in pillar.hosts.keys() if host != grains['id'] -%}
      proto tcp dport 179 saddr {{ pillar.hosts[host].ipv4.freifunk }} ACCEPT;
      proto tcp dport 179 saddr {{ pillar.hosts[host].ipv6.freifunk }} ACCEPT;
      {% endfor %}
    }
    {% if pillar.peerings[grains['id']].type == "icvpn" -%}
    # Allow bgp traffic on interface {{ pillar['tinc']['netname'] }}
    interface {{ pillar['tinc']['netname'] }} {
      proto tcp dport 179 ACCEPT;
    }
    {%- endif %}

    {% if pillar.peerings[grains['id']].type == "ice" -%}
    # Allow bgp with our icevpn peers
    {% for peer in pillar.peerings[grains['id']].peers.keys() %}
    interface tun-{{ peer }} {
      proto tcp dport 179 ACCEPT;
    }
    {% endfor %}
    {%- endif %}

    # Accept bird-lg
    proto tcp dport 5000 saddr {{ pillar['hosts']['srv1']['ipv4']['public'] }} ACCEPT;
    proto tcp dport 5000 saddr {{ pillar['hosts']['srv1']['ipv4']['freifunk'] }} ACCEPT;
  }
}

