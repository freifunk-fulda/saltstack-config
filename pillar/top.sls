base:
  '*':
    - global
    - ssh
    - snmpd
    - fastd
    - apache2
    - peerings

  'gw*':
    - bind
    - tinc
    - openvpn
