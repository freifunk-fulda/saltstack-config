# Install and start the latest fastd package
#
fastd:
  pkgrepo.managed:
    - humanname: universe-factory.net
    - name: deb http://repo.universe-factory.net/debian/ sid main
    - dist: sid
    - file: /etc/apt/sources.list.d/fastd.list
    - keyid: 16EF3F64CB201D9C
    - keyserver: pgpkeys.mit.edu

  pkg.installed:
    - name: fastd

  service.running:
    - name: fastd@fffd
    - enable: True
    - watch:
      - file: /etc/fastd/fffd/*


# Disable the fastd default service
# (we want fastd@fffd instead)
#
/etc/systemd/system/fastd.service:
  file.symlink:
    - target: /dev/null
    - force: True
    - makedirs: True


# Make fastd instances dependon the according batman interfaces
#
/etc/systemd/system/fastd@.service.d/batman.conf:
  file.managed:
    - makedirs: True
    - content: |
        [Unit]
        Reqiures=batman@%i.service
        After=batman@%i.service


# fastd configuration files
#
fastd.conf:
  file.managed:
    - name: /etc/fastd/fffd/fastd.conf
    - user: root
    - group: root
    - mode: 640
    - source: salt://fastd/fastd.conf.tpl
    - makedirs: True
    - template: jinja
    - require:
      - pkg: fastd


# Get fastd keys of backend nodes
#
# Disabled for transition phase - backbone is handled by a different fastd instance
fastd.peers.backend:
  git.latest:
    - name: https://github.com/freifunk-fulda/fffd-peers-backbone.git
    - target: /etc/fastd/fffd/fffd-peers-backbone

# Create directory for fastd keys of nodes
# and allow www-data to access it
#
/etc/fastd/fffd:
  file.directory:
    - user: root
    - group: www-data
    - mode: 750

/etc/fastd/fffd/fffd-peers-nodes:
  file.directory:
    - user: root
    - group: www-data
    - mode: 770
    - makedirs: True


# Configure firewall to allow fastd traffic
#
fastd.ferm:
  file.managed:
    - name: /etc/ferm.d/11-fastd.conf
    - source: salt://fastd/ferm.conf.tpl
    - makedirs: True


# Enable process monitoring with Net-SNMP
#
fastd.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.fastd.conf
    - source: salt://fastd/netsnmp.proc.conf
    - makedirs: True
