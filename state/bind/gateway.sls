# Install gateway specific configuration files
#
bind9.named.conf.local:
  file.managed:
    - name: /etc/bind/named.conf.local
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/files/named.conf.local.tpl
    - template: jinja
    - require:
      - pkg: bind9

bind9.named.conf.tsigkeys:
  file.managed:
    - name: /etc/bind/named.conf.tsigkeys
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/files/named.conf.tsigkeys.tpl
    - template: jinja
    - require:
      - pkg: bind9


# Create directory for zone information
# Contents will be transferred by the dns master
#
/opt/fffd-dns/zones:
  file.directory:
    - user: bind
    - group: root
    - mode: 770
    - makedirs: True


# Configure firewall to allow dns
#
bind9.ferm:
  file.managed:
    - name: /etc/ferm.d/50-dns.conf
    - source: salt://bind/files/ferm.conf
    - makedirs: True
    - template: jinja
    - require:
      - pkg: bind9


# Enable process monitoring with Net-SNMP
#
bind9.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.bind9.conf
    - source: salt://bind/files/netsnmp.proc.conf
    - makedirs: True
