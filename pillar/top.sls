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

  'roles:gateway':
    - match: grain
    - ffrl
    - tinc
    - openvpn
    - dhcp

  'srv1':
    - mysql
