# apt base configuration
# (including automatic security upgrades)
#
apt:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - unattended-upgrades
      - apt-listchanges


apt.unattended:
  file.managed:
    - name: /etc/apt/apt.conf.d/50unattended-upgrades
    - source: salt://apt/50unattended-upgrades
    - makedirs: True

apt.auto-upgrades:
  file.managed:
    - name: /etc/apt/apt.conf.d/20auto-upgrades
    - source: salt://apt/20auto-upgrades
    - makedirs: True

