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

respondder:
  service.running:
    - enable: True
    - require:
      - git: https://github.com/freifunk-darmstadt/respondder.git
      - file: /etc/systemd/system/respondd.service
      - pkg: respondd_deps
