# Add package repo
#

# Install alfred
#
alfred:
  cmd.run:
    - name: dpkg -i /tmp/alfred_2015.1-1_amd64.deb
    - require:
      - file: /tmp/alfred_2015.1-1_amd64.deb
    - watch:
      - file: /tmp/alfred_2015.1-1_amd64.deb


/tmp/alfred_2015.1-1_amd64.deb:
   file.managed:
      - source: salt://alfred/alfred_2015.1-1_amd64.deb


# Install alfred-json
#
alfred-json:
  cmd.run:
    - name: dpkg -i /tmp/alfred-json_0.3.1-1_amd64.deb
    - require:
      - file: /tmp/alfred-json_0.3.1-1_amd64.deb
    - watch:
      - file: /tmp/alfred-json_0.3.1-1_amd64.deb

/tmp/alfred-json_0.3.1-1_amd64.deb:
   file.managed:
      - source: salt://alfred/alfred-json_0.3.1-1_amd64.deb



# Add systemd service alfred
#
alfred@.service:
  file.managed:
    - name: /etc/systemd/system/alfred@.service
    - user: root
    - group: root
    - mode: 644
    - source: salt://alfred/alfred@.service
    - makedirs: True



# Add systemd service batadv-vis
#
batadv-vis@.service:
  file.managed:
    - name: /etc/systemd/system/batadv-vis@.service
    - user: root
    - group: root
    - mode: 644
    - source: salt://alfred/batadv-vis@.service
    - makedirs: True


# Start services
#
alfred.service:
  service.running:
    - name: alfred@fffd.service
    - enable: True
    - require:
      - cmd: alfred
      - cmd: alfred-json
      - file: alfred@.service
      - file: batadv-vis@.service

batadv-vis.service:
  service.running:
    - name: batadv-vis@fffd.service
    - enable: True
    - require:
      - cmd: alfred
      - cmd: alfred-json
      - file: alfred@.service
      - file: batadv-vis@.service


# Announce facts about server
alfred.announce:
  pkg.installed:
    - pkgs:
      - ethtool
      - python3-netifaces
  git.latest:
    - name: https://github.com/freifunk-fulda/alfred-announce.git
    - target: /opt/alfred-announce
  cmd.wait:
    - name: python3 setup.py install
    - cwd: /opt/alfred-announce 
    - watch:
      - git: alfred.announce

alfred.announce.facts:
  git.latest:
    - name: https://github.com/freifunk-fulda/alfred-facts.git
    - target: /etc/alfred/facts

alfred.announce.cron:
  file.managed:
    - name: /etc/cron.d/alfred-announce
    - contents: |
        * *    * * *   root    python3 -m alfred.announce -b fffd.bat -i fffd.bat -f fffd.vpn


# Firewall configuration
#
alfred.ferm:
  file:
    - managed
    - name: /etc/ferm.d/50-alfred.conf
    - source: salt://alfred/ferm.conf
    - makedirs: True


# Enable process monitoring with Net-SNMP
#
alfred.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.alfred.conf
    - source: salt://alfred/netsnmp.proc.conf
    - makedirs: True
