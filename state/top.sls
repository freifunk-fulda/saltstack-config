base:
  '*':
    - common.unwanted
    - common.tools
    - common.root
    - common.apt-backports

    - networking.common
    - ferm.common

    - fastd
    - batman
    - alfred

    - sysctl
    - rsyslog
    - logrotate
    - snmpd
    - munin
    - postfix
    - ntp

    - ssh.server
    - ssh.client

    - apache2.common


  'gw*':
    - ferm.gateway
    - networking.gateway

    - fffd-utils
    - salt
    - munin.gateway

    - dhcp
    - bind
    - radvd
    - apache2.gateway
    - openvpn
    - bird

{% if pillar.peerings[grains['id']].type == "icvpn" %}
    - tinc
{% elif pillar.peerings[grains['id']].type == "ice" %}
    - ice.gre
    - ice.ipsec
{% endif %}

