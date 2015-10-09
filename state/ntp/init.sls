# Install and start ntp
#
ntp:
  pkg.installed:
    - name: ntp
  service.running:
    - enable: True
    - name: ntp
    - require:
      - pkg: ntp
    - watch:
      - file: /etc/ntp.conf


# NTP configuration
#
ntp.conf:
  file:
    - managed
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf
    - makedirs: True


# Firewall configuration
#
ntp.ferm:
  file:
    - managed
    - name: /etc/ferm.d/50-ntp.conf
    - source: salt://ntp/ferm.conf
    - makedirs: True

