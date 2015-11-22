munin:
  pkg.installed:
    - name: munin

munin.conf:
   file.managed:
    - name: /etc/munin/munin-conf.d/munin.conf
    - user: root
    - group: munin
    - mode: 640
    - source: salt://munin/master/munin.conf
    - require:
      - pkg: munin
      - pkg: munin-node

munin.templates:
  file.recurse:
    - name: /etc/munin/templates
    - user: root
    - group: munin
    - dir_mode: 2775
    - file_mode: '0644'
    - source: salt://munin/master/templates
    - include_empty: True

munin.static:
  file.recurse:
    - name: /etc/munin/static
    - user: root
    - group: munin
    - dir_mode: 2775
    - file_mode: '0644'
    - source: salt://munin/master/static
    - include_empty: True


# Enable process monitoring with Net-SNMP
#
munin.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.munin.conf
    - source: salt://munin/netsnmp.proc.conf
    - makedirs: True
