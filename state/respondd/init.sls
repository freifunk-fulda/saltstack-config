# Install and enable respondd
#
https://github.com/freifunk-darmstadt/respondder.git:
  git.latest:
    - target: /opt/respondd

/etc/systemd/system/respondd.service:
  file.managed:
    - source: salt://respondd/files/respondd.service
    - user: root
    - group: root
    - mode: 644

respondd_deps:
   pkg.latest:
     - pkgs:
       - ethtool
       - lsb-release

respondd:
  service.running:
    - enable: True
    - require:
      - git: https://github.com/freifunk-darmstadt/respondder.git
      - file: /etc/systemd/system/respondd.service
      - pkg: respondd_deps


# Allow snmpd management traffic
#
respondd.ferm:
  file.managed:
    - name: /etc/ferm.d/20-respondd.conf
    - source: salt://respondd/files/ferm.conf
    - makedirs: True