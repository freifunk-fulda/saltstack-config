# Install and start ntp
#
ntp:
  pkg.installed:
    - name: ntp

  service.running:
    - enable: True
    - name: ntp
    - watch:
      - file: /etc/files/ntp.conf


# NTP configuration
#
ntp.conf:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/files/ntp.conf
    - makedirs: True


# Firewall configuration
#
ntp.ferm:
  file.managed:
    - name: /etc/ferm.d/50-ntp.conf
    - source: salt://ntp/files/ferm.conf
    - makedirs: True
