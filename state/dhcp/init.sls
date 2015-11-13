# Install and start dhcp server
#
isc-dhcp-server:
  pkg.installed:
    - name: isc-dhcp-server
  service.running:
    - name: isc-dhcp-server
    - enable: True
    - require:
      - pkg: isc-dhcp-server
      - pkg: fastd
    - watch:
      - file: /etc/dhcp/*

# DHCP configuration
#
dhcpd.conf:
  file.managed:
    - name: /etc/dhcp/dhcpd.conf
    - user: root
    - group: root
    - mode: 640
    - source: salt://dhcp/dhcpd.conf.tpl
    - template: jinja
    - require:
      - pkg: isc-dhcp-server

# Bind to specific interfaces only
#
dhcpd.default:
  file.managed:
    - name: /etc/default/isc-dhcp-server
    - user: root
    - group: root
    - mode: 640
    - source: salt://dhcp/isc-dhcp-server.default
    - require:
      - pkg: isc-dhcp-server

# Firewall configuration
#
dhcpd.ferm:
  file:
    - managed
    - name: /etc/ferm.d/50-dhcpd.conf
    - source: salt://dhcp/ferm.conf
    - makedirs: True


# Enable process monitoring with Net-SNMP
#
dhcpd.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.dhcpd.conf
    - source: salt://dhcp/netsnmp.proc.conf
    - makedirs: True
