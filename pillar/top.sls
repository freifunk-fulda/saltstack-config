base:
  '*':
    - global
    - ssh
    - snmpd
    - fastd
    - apache2
    - peerings
    - bind
    - ssmtp

  'gw*':
    - ffrl
    - tinc
    - openvpn
    - dhcp

  'srv*':
    - mysql
