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
    - dhcp

  'srv1':
    - mysql
