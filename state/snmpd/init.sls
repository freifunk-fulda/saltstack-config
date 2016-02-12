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
      - file: /etc/snmp/*

# Fix service dependencies
#
snmpd.service:
  file.managed:
    - name: /etc/systemd/system/snmpd.service.d/wants-batman-fffd.conf
    - contents: |
        [Unit]
        Wants=batman@fffd.service
        After=batman@fffd.service
    - makedirs: True

# Configure snmpd
#
snmpd.conf:
  file:
    - managed
    - name: /etc/snmp/snmpd.conf
    - source: salt://snmpd/snmpd.conf
    - makedirs: True
    - template: jinja

# Create include directory
#
/etc/snmp/conf.d:
   file.directory:
     - name: /etc/snmp/conf.d
     - makedirs: True

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
