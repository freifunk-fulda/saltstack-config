# Firewall configuration
#

# Allow OpenNMS to receive Syslog messages
ferm.opennms.syslogd:
  file.managed:
    - name: /etc/ferm.d/20-opennms-syslogd.conf
    - source: salt://opennms/ferm.syslogd.conf
    - makedirs: True
