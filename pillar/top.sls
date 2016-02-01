base:
  '*':
    - global
    - ssh
    - snmpd
    - fastd
    - apache2
    - peerings
    - bind

  'gw*':
    - tinc
    - openvpn

  'srv*':
    - mysql
