# Firewall configuration
#

# Allow OpenNMS to receive SNMP Traps
ferm.opennms.trapd:
  file.managed:
    - name: /etc/ferm.d/20-opennms-trapd.conf
    - source: salt://opennms/ferm.trapd.conf
    - makedirs: True
