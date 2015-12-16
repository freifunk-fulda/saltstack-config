# Install and enable munin
#
munin-node:
  pkg.installed:
    - pkgs:
      - munin-node
      - libcommon-sense-perl

  service.running:
    - name: munin-node
    - enable: True
    - require:
      - pkg: fastd
      - pkg: munin-node
    - watch:
      - file: /etc/munin/*


# Munin node configuration
#
munin-node.conf:
  file.managed:
    - name: /etc/munin/munin-node.conf
    - user: root
    - group: munin
    - mode: 640
    - source: salt://munin/munin-node.conf.tpl
    - template: jinja
    - require:
      - pkg: munin-node


# Enable munin management traffic
#
ferm.munin.conf:
  file:
    - managed
    - name: /etc/ferm.d/20-munin.conf
    - source: salt://munin/ferm.conf
    - makedirs: True


# Enable process monitoring with Net-SNMP
#
munin.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.munin.conf
    - source: salt://munin/netsnmp.proc.conf
    - makedirs: True

