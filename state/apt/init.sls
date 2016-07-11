# apt configuration: Install needed packages
# and enable automatic security upgrades
#
apt:
  pkg.latest:
    - pkgs:
      - apt-transport-https
      - unattended-upgrades
      - apt-listchanges


# Install backports repository
#
apt.backports:
  pkgrepo.managed:
    - name: deb http://http.debian.net/debian jessie-backports main
    - file: /etc/apt/sources.list.d/backports.list


# Configure unattended upgrades
#
apt.unattended:
  file.managed:
    - name: /etc/apt/apt.conf.d/50unattended-upgrades
    - source: salt://apt/files/50unattended-upgrades
    - makedirs: True

apt.auto-upgrades:
  file.managed:
    - name: /etc/apt/apt.conf.d/20auto-upgrades
    - source: salt://apt/files/20auto-upgrades
    - makedirs: True

