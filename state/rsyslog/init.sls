# Install and enable the rsyslog server
#
rsyslog:
  pkg.installed:
    - name: rsyslog

  service.running:
    - name: rsyslog
    - enable: True
    - require:
      - pkg: rsyslog
    - watch:
      - file: /etc/rsyslog.conf
      - file: /etc/rsyslog.d/*


# Configure rsyslog
#
rsyslog.conf:
  file.managed:
    - name: /etc/rsyslog.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://rsyslog/rsyslog.conf
    - require:
      - pkg: rsyslog

# Disable dhcp logging
#
rsyslog.dhcp.conf:
  file.managed:
    - name: /etc/rsyslog.d/dhcp.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://rsyslog/rsyslog.dhcp.conf.tpl
    - template: jinja
    - require:
      - pkg: rsyslog


# Enable process monitoring with Net-SNMP
#
rsyslog.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.rsyslog.conf
    - source: salt://rsyslog/netsnmp.proc.conf
    - makedirs: True
