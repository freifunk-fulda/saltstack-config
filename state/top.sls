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

    - dhcp
    - bind
    - radvd
    - apache2.gateway
    - openvpn
    - tinc
    - bird
