# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# IPv6 firewall - gre rules


# Allow GRE (Protocol 47)
#
domain (ip ip6)
table filter {
  chain INPUT {
    # GRE peers (our own gateways)
    # FIXME FIXME: THIS SHOULD NOT BE HARDCODED!
    #
    proto 47 saddr 2001:4ba0:babe:493::fffd ACCEPT;
    proto 47 saddr 2a01:4f8:171:2729::fffd ACCEPT;

    # GRE peers (dn42, freifunk, ...)
    #
    {% for peer, values in pillar.peerings[grains['id']].peers.iteritems() -%}
    proto 47 saddr {{ values['remote'] }} ACCEPT;
    {% endfor %}
  }
}


# Disable connection tracking for the GRE tunnel
#
domain (ip ip6)
table raw {
  chain PREROUTING {
    proto gre {
      # GRE peers (our own gateways)
      # FIXME FIXME: THIS SHOULD NOT BE HARDCODED!
      #
      saddr 2001:4ba0:babe:493::fffd NOTRACK;
      saddr 2a01:4f8:171:2729::fffd NOTRACK;

      # GRE peers (dn42, freifunk, ...)
      #
      {% for peer, values in pillar.peerings[grains['id']].peers.iteritems() -%}
      saddr {{ values['remote'] }} NOTRACK;
      {%- endfor %}
    }
  }
}

