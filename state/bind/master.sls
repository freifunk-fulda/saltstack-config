# Install master specific configuration files
#
bind9.master.named.conf.local:
  file.managed:
    - name: /etc/bind/named.conf.local
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/files/named.conf.local.master.tpl
    - template: jinja
    - require:
      - pkg: bind9

bind9.master.named.conf.tsigkeys:
  file.managed:
    - name: /etc/bind/named.conf.tsigkeys
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/files/named.conf.tsigkeys.master.tpl
    - template: jinja
    - require:
      - pkg: bind9


# Clone zone information repo
#
/opt/fffd-dns/zones:
  git.latest:
    - name: https://github.com/freifunk-fulda/fffd-dns
    - target: /opt/fffd-dns


# Refresh zone repo regularly using cron
#
bind9.zones.update:
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
    - source: salt://bind/files/fffd-dns-nodes.cron

  cmd.run:
    - name: /etc/cron.hourly/fffd-dns-nodes


# Configure firewall to allow dns
#
bind9.master.ferm:
  file.managed:
    - name: /etc/ferm.d/50-dns.conf
    - source: salt://bind/files/ferm.master.conf
    - makedirs: True
    - template: jinja
    - require:
      - pkg: bind9


# Enable process monitoring with Net-SNMP
#
bind9.master.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.bind9.conf
    - source: salt://bind/files/netsnmp.proc.conf
    - makedirs: True
