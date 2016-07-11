# Install and start dhcp server
#
isc-dhcp-server:
  pkg.installed:
    - name: isc-dhcp-server

  service.running:
    - name: isc-dhcp-server
    - enable: True
    - require:
      - pkg: fastd
      - mount: /var/lib/dhcp
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
    - source: salt://dhcp/files/dhcpd.conf.tpl
    - template: jinja


# Bind to specific interfaces only
#
dhcpd.default:
  file.managed:
    - name: /etc/default/isc-dhcp-server
    - user: root
    - group: root
    - mode: 640
    - source: salt://dhcp/files/isc-dhcp-server.default


# Integrate phpIPAM
#
dhcpd.phpipam:
  cron.present:
    - name: /opt/fffd-utils/phpipam-integrator.py

  pkg.installed:
    - name: python3-jinja2

  file.directory:
    - name: /var/cache/dhcp

  cmd.wait:
    - name: /opt/fffd-utils/phpipam-integrator.py
    - watch:
      - file: /etc/phpipam-integrator
      - file: /etc/dhcp/dhcpd.static.conf.tmpl


dhcpd.phpipam.conf:
  file.managed:
    - name: /etc/phpipam-integrator
    - source: salt://dhcp/files/phpipam-integrator.tmpl
    - makedirs: True
    - template: jinja


dhcpd.phpipam.tmpl:
  file.managed:
    - name: /etc/dhcp/dhcpd.static.conf.tmpl
    - source: salt://dhcp/files/dhcpd.static.conf.tmpl
    - makedirs: True


# Mount tmpfs to /var/lib/dhcp to keep leases in RAM
#
/var/lib/dhcp:
  mount.mounted:
    - device: none
    - fstype: tmpfs
    - opts: size=10M
    - dump: 0
    - pass_num: 0
    - persist: True
    - mkmnt: True

# Firewall configuration
#
dhcpd.ferm:
  file:
    - managed
    - name: /etc/ferm.d/50-dhcpd.conf
    - source: salt://dhcp/files/ferm.conf
    - makedirs: True


# Enable process monitoring with Net-SNMP
#
dhcpd.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.dhcpd.conf
    - source: salt://dhcp/files/netsnmp.proc.conf
    - makedirs: True
