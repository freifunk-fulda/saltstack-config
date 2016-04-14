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
    {% for peer, values in pillar.ffrl[grains['id']].peers.iteritems() -%}
    proto 47 saddr {{ values['endpoint'] }} ACCEPT;
    {% endfor %}
  }
}


# Disable connection tracking for the GRE tunnel
#
domain (ip ip6)
table raw {
  chain PREROUTING {
    proto gre {
      {% for peer, values in pillar.ffrl[grains['id']].peers.iteritems() -%}
      saddr {{ values['endpoint'] }} NOTRACK;
      {%- endfor %}
    }
  }
}

