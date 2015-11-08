# Install and enable bind9
#
bind9:
  pkg.installed:
    - name: bind9
  service.running:
    - name: bind9
    - enable: True
    - require:
      - pkg: bind9
    - watch:
      - file: /etc/bind/named.conf
      - file: /etc/bind/named.conf.*

# bind9 configuration
#
named.conf:
  file.managed:
    - name: /etc/bind/named.conf
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/named.conf
    - require:
      - pkg: bind9


named.conf.options:
  file.managed:
    - name: /etc/bind/named.conf.options
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/named.conf.options.tpl
    - template: jinja
    - require:
      - pkg: bind9


named.conf.local:
  file.managed:
    - name: /etc/bind/named.conf.local
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/named.conf.local.tpl
    - template: jinja
    - require:
      - pkg: bind9

named.conf.tsigkeys:
  file.managed:
    - name: /etc/bind/named.conf.tsigkeys
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/named.conf.tsigkeys.tpl
    - template: jinja
    - require:
      - pkg: bind9

# Create directory for zone information
#
/opt/fffd-dns/zones:
  file.directory:
    - user: bind
    - group: root
    - mode: 770
    - makedirs: True


# We want to use ourself as the primary resolver
#
resolv.conf:
  file.managed:
    - name: /etc/resolv.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://bind/resolv.conf
    - require:
      - pkg: bind9


# Configure firewall to allow dns
#
bind9.ferm:
  file.managed:
    - name: /etc/ferm.d/50-dns.conf
    - source: salt://bind/ferm.conf
    - makedirs: True

