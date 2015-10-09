# Install and enable snmpd
#
snmpd:
  pkg:
    - installed
    - name: snmpd
  service:
    - running
    - enable: True
    - name: snmpd
    - require:
      - pkg: fastd
      - pkg: snmpd
    - watch:
      - file: /etc/snmp/snmpd.conf

# Configure snmpd
#
snmpd.conf:
  file:
    - managed
    - name: /etc/snmp/snmpd.conf
    - source: salt://snmpd/snmpd.conf
    - makedirs: True
    - template: jinja

# Reduce snmpd logging
#
snmpd.default:
  file:
    - managed
    - name: /etc/default/snmpd
    - source: salt://snmpd/snmpd.default
    - user: root
    - group: root
    - mode: 640
    - makedirs: True


# Allow snmpd management traffic
#
snmpd.ferm:
  file:
    - managed
    - name: /etc/ferm.d/20-snmp.conf
    - source: salt://snmpd/ferm.conf
    - makedirs: True

