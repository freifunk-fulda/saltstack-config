# Install a bunch of standard tools
#
tools:
  pkg.installed:
    - pkgs:
      - screen
      - vim-nox
      - htop
      - iptraf
      - iotop
      - sysstat
      - vnstat
      - vnstati
      - iperf
      - tcpdump
      - mtr
      - less
      - haveged
      - ntp
      - sudo
      - git
      - bzip2
      - python-pip
      - python3-pip


# Enable process monitoring with Net-SNMP for some processes of tools
#
tools.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.common.tools.conf
    - source: salt://snmpd/files/netsnmp.proc.conf
    - makedirs: True
