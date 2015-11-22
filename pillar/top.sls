base:
  '*':
    - global
    - ssh
    - snmpd
    - fastd
    - apache2

  'gw*':
    - bind
    - tinc
    - openvpn
