# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# IPv6 firewall - gre rules for fffd (gw interconnect)


# Allow GRE (Protocol 47)
#
domain ip
table filter {
  chain INPUT {
    proto gre {
      {% for gw in pillar['hosts'].keys() if gw != grains['id'] and gw.startswith('gw') and pillar['hosts'][gw]['enabled'] -%}
      saddr {{ pillar.hosts[gw].ipv4.public }} ACCEPT;
      {% endfor %}
    }
  }
}


# Disable connection tracking for the GRE tunnel
#
domain ip
table raw {
  chain PREROUTING {
    proto gre {
      {% for gw in pillar['hosts'].keys() if gw != grains['id'] and gw.startswith('gw') and pillar['hosts'][gw]['enabled'] -%}
      saddr {{ pillar.hosts[gw].ipv4.public }} NOTRACK;
      {%- endfor %}
    }
  }
}

