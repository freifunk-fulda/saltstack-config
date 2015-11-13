# Install and enable radvd
#
radvd:
  pkg.installed:
    - name: radvd
  service.running:
    - name: radvd
    - enable: True
    - require:
      - pkg: radvd
      - file: /etc/sysctl.d/10-default.conf
    - watch:
      - file: /etc/radvd.conf


# radvd configuration
#
radvd.conf:
  file.managed:
    - name: /etc/radvd.conf
    - user: root
    - group: root
    - mode: 640
    - source: salt://radvd/radvd.conf.tpl
    - template: jinja
    - require:
      - pkg: radvd


# Enable process monitoring with Net-SNMP
#
radvd.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.radvd.conf
    - source: salt://radvd/netsnmp.proc.conf
    - makedirs: True
