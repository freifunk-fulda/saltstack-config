base:
  '*':
    - common.unwanted
    - common.tools
    - common.root
    - common.apt-backports
    - common.locales

    - salt

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
    - apt

    - ssh.server
    - ssh.client

    - apache2.common
    - fffd-utils.common


  'gw*':
    - ferm.gateway
    - networking.gateway

    - munin.gateway
    - fffd-utils.gateway

    - dhcp
    - bind.gateway
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

  'gw02':
    - webtropia

  'srv1':
    - apache2.homepage
    - bind.master
    - salt.master
    - mysql.server

