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
    - tinc
    - openvpn
    - dhcp

  'srv*':
    - mysql
