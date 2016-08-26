base:
  '*':
    - apt
    - common.unwanted
    - common.tools
    - common.root
    - common.locales

    - salt

    - networking.common
    - ferm.common

    - fastd
    - batman
    - respondd

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
    - fffd-utils.common


  'gw*':
    - ferm.gateway
    - networking.gateway

    - munin.gateway
    - fffd-utils.gateway

    - bind.common
    - bind.gateway
    - dhcp

    - radvd
    - apache2.gateway
    - bird

{% if pillar.peerings[grains['id']].type == "icvpn" %}
    - tinc
{% elif pillar.peerings[grains['id']].type == "ice" %}
    - ice.gre
    - ice.ipsec
{% endif %}

  'roles:kvm':
    - match: grain
    - libvirt
    - ksm
    - networking.bridgeutils

  'gw02':
    - webtropia
    - ffrl

  'gw03':
    - ffrl

  'gw04':
    - ffrl

  'srv1':
    - apache2.homepage
    - bind.common
    - bind.master
    - salt.master
    - mysql.server
