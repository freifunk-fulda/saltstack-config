# Install and enable bird
#
bird:
  pkg.installed:
    - name: bird

  service.running:
    - name: bird
    - enable: True
    - reload: True
    - require:
      - pkg: bird
    - watch:
      - file: /etc/bird/*

# Install and enable bird6
#
bird6:
  pkg.installed:
    - name: bird

  service.running:
    - name: bird6
    - enable: True
    - reload: True
    - require:
      - pkg: bird6
    - watch:
      - file: /etc/bird/*



# bird ipv4 configuration
#
/etc/bird/bird.conf:
  file.managed:
    - name: /etc/bird/bird.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://bird/bird.conf.tpl
    - template: jinja
    - require:
      - pkg: bird

/etc/bird/bird.conf.d:
  file.recurse:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - source: salt://bird/bird.conf.d
    - include_empty: True
    - makedirs: True
    - template: jinja
    - require:
      - pkg: bird


# bird ipv6 configuration
#
/etc/bird/bird6.conf:
  file.managed:
    - name: /etc/bird/bird6.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://bird/bird6.conf.tpl
    - template: jinja
    - require:
      - pkg: bird6

/etc/bird/bird6.conf.d:
  file.recurse:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - source: salt://bird/bird6.conf.d
    - include_empty: True
    - makedirs: True
    - template: jinja
    - require:
      - pkg: bird6


{% if pillar.peerings[grains['id']].type == "icvpn" %}
/etc/bird/icvpn:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/cron.hourly/update-icvpn:
  file.symlink:
    - target: /opt/fffd-utils/update-icvpn.sh
    - force: True
    - require:
      - git: fffd-utils.repo
      - file: /etc/bird/icvpn

  cmd.script:
    - source: /opt/fffd-utils/update-icvpn.sh
    - shell: /bin/bash
    - env:
      - FORCE_VPN: "1"
      - FORCE_META: "1"
    - require:
      - git: fffd-utils.repo
{% endif %}


bird-lg:
  pip.installed:
    - pkgs:
      - pymemcache
      - dnspython
      - pydot
      - flask

  git.latest:
    - name: https://github.com/mweinelt/bird-lg.git
    - target: /opt/bird-lg

  service.running:
    - name: bird-lg
    - enable: True
    - require:
      - git: bird-lg

  file.managed:
    - name: /opt/bird-lg/lgproxy.cfg
    - source: salt://bird/bird-lg/lgproxy.cfg.tpl
    - template: jinja

bird-lg.service:
  file.managed:
    - name: /etc/systemd/system/bird-lg.service
    - user: root
    - group: root
    - mode: 644
    - source: salt://bird/bird-lg/bird-lg.service
    - makedirs: True




bird.ferm:
  file:
    - managed
    - name: /etc/ferm.d/12-bird.conf
    - source: salt://bird/ferm.conf.tpl
    - makedirs: True
    - template: jinja


# Enable process monitoring with Net-SNMP
#
bird.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.bird.conf
    - source: salt://bird/netsnmp.proc.conf
    - makedirs: True
