# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# IPv6 firewall - gre rules for ffrl


# Allow GRE (Protocol 47)
#
domain (ip ip6)
table filter {
  chain INPUT {
    # GRE
    #
    {% for peer, value in pillar.ffrl.peers.endpoints.iteritems() -%}
    proto 47 saddr {{ value }} ACCEPT;
    {% endfor %}
  }
}


# Disable connection tracking for the GRE tunnel
#
domain (ip ip6)
table raw {
  chain PREROUTING {
    proto gre {
      {% for peer, value in pillar.ffrl.peers.endpoints.iteritems() -%}
      saddr {{ value }} NOTRACK;
      {%- endfor %}
    }
  }
}

