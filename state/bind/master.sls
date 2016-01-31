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
    - source: salt://bind/named.conf.tpl
    - template: jinja
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
    - source: salt://bind/named.conf.local.master.tpl
    - template: jinja
    - require:
      - pkg: bind9

named.conf.tsigkeys:
  file.managed:
    - name: /etc/bind/named.conf.tsigkeys
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/named.conf.tsigkeys.master.tpl
    - template: jinja
    - require:
      - pkg: bind9

# Clone zone information repo
#
/opt/fffd-dns/zones:
  git.latest:
    - name: https://github.com/freifunk-fulda/fffd-dns
    - target: /opt/fffd-dns


# Refresh zone repo regularly
#
zones.update:
  file.symlink:
    - name: /etc/cron.d/update_fffd-dns
    - target: /opt/fffd-utils/update_fffd-dns.cron
    - require:
      - git: fffd-utils.repo


# Add script for generating nodes.fffd.eu zone
#
fffd-dns-nodes.cron:
  file.managed:
    - name: /etc/cron.hourly/fffd-dns-nodes
    - user: root
    - group: root
    - mode: 755
    - source: salt://bind/fffd-dns-nodes.cron
    - require:
      - pkg: bind9

  cmd.run:
    - name: /etc/cron.hourly/fffd-dns-nodes


# Configure firewall to allow dns
#
bind9.ferm:
  file.managed:
    - name: /etc/ferm.d/50-dns.conf
    - source: salt://bind/ferm.master.conf
    - makedirs: True
    - template: jinja


# Enable process monitoring with Net-SNMP
#
bind9.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.bind9.conf
    - source: salt://bind/netsnmp.proc.conf
    - makedirs: True
