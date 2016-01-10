# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# ipsec.conf - strongSwan IPsec configuration file


config setup
        # strictcrlpolicy=yes
        # uniqueids = no


# Defaults
#
conn %default
        keyexchange=ikev1
        ikelifetime=28800s
        type=transport
        leftprotoport=gre
        rightprotoport=gre
        ike=aes256-sha256-modp4096!
        esp=aes256-sha1-modp4096!
        dpdaction=restart
        leftsubnet=%dynamic[gre]
        rightsubnet=%dynamic[gre]
        auto=route
        dpddelay=30s
        dpdtimeout=120s
        dpdaction=restart
        lifetime=3600s


# Peers
#
{% for peer, values in pillar.peerings[grains['id']].peers.iteritems() %}
conn tun-{{ peer }}
        authby=pubkey
        {% if pillar.peerings[grains['id']].peers[peer].proto == "ip6gre" -%}
        left={{ pillar.hosts[grains['id']].ipv6.public }}
        {% elif  pillar.peerings[grains['id']].peers[peer].proto == "gre" -%}
        left={{ pillar.hosts[grains['id']].ipv4.public }}
        {% endif -%}
        right={{ values['remote'] }}
        leftrsasigkey=/etc/ipsec.d/public/{{grains['id']}}.pub
        rightrsasigkey=/etc/ipsec.d/public/{{ peer }}.pub
        keyexchange={{ values['keyexchange']}}
        ike={{ values['ike'] }}
        esp={{ values['esp'] }}

{% endfor %}



include /var/lib/strongswan/ipsec.conf.inc

