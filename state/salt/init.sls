# Install and enable salt-minion
#
salt:
  pkg.installed:
    - name: salt-minion
  service.running:
    - name: salt-minion
    - enable: True
    - require:
      - pkg: salt-minion
    - watch:
      - file: /etc/salt/*

# configuration
#
carbon.conf:
  file.managed:
    - name: /etc/salt/minion.d/carbon.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://salt/carbon.conf
    - require:
      - pkg: salt-minion


# Enable process monitoring with Net-SNMP
#
salt.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.salt.conf
    - source: salt://bind/netsnmp.proc.conf
    - makedirs: True
