# Install and enable snmpd
#
snmpd:
  pkg.installed:
    - name: snmpd

  service.running:
    - enable: True
    - name: snmpd
    - watch:
      - file: /etc/snmp/*


# Configure snmpd
#
snmpd.conf:
  file.managed:
    - name: /etc/snmp/snmpd.conf
    - source: salt://snmpd/files/snmpd.conf
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
  file.managed:
    - name: /etc/default/snmpd
    - source: salt://snmpd/files/snmpd.default
    - user: root
    - group: root
    - mode: 640
    - makedirs: True


# Allow snmpd management traffic
#
snmpd.ferm:
  file.managed:
    - name: /etc/ferm.d/20-snmp.conf
    - source: salt://snmpd/files/ferm.conf
    - makedirs: True
    - template: jinja
