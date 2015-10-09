base:
  '*':
    - common.unwanted
    - common.tools
    - common.root
    - common.apt-backports
    - fffd-utils

    - networking

    - sysctl
    - ferm

    - rsyslog
    - snmpd
    - munin

    - postfix
    - ssh.server
    - ssh.client

    - fastd
    - batman
    - alfred

    - ntp
    - dhcp
    - bind
    - radvd
    - apache2
    - openvpn
    - tinc
    - bird
