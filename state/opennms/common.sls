# Firewall configuration
#
# Hardening OpenNMS and don't allow RMI 1099 port on IPv4 and IPv6
ferm.opennms.common:
   file.managed:
     - name: /etc/ferm.d/20-opennms-common.conf
     - source: salt://opennms/ferm.common.conf
     - makedirs: True
