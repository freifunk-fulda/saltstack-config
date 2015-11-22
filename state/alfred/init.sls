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


# Enable process monitoring with Net-SNMP
#
alfred.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.alfred.conf
    - source: salt://alfred/netsnmp.proc.conf
    - makedirs: True
