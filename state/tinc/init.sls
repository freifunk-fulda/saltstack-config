# Install and enable tinc
#
tinc:
  pkg.installed:
    - name: tinc

  service.running:
    - name: tinc
    - enable: True
    - require:
      - pkg: tinc
    - watch:
      - file: /etc/tinc/icvpn/*


# Enable icvpn network
#
/etc/tinc/nets.boot:
  file.managed:
    - name: /etc/tinc/nets.boot
    - user: root
    - group: root
    - mode: 644
    - source: salt://tinc/nets.boot.tpl
    - template: jinja
    - require:
      - pkg: tinc


# ICVPN: peers repo and automatic update
#
tinc.icvpn-meta.repo:
  git.latest:
    - name: https://github.com/freifunk/icvpn-meta
    - target: /opt/icvpn-meta

tinc.icvpn-scripts.repo:
  git.latest:
    - name: https://github.com/freifunk/icvpn-scripts
    - target: /opt/icvpn-scripts

tinc.icvpn.repo:
  git.latest:
    - name: https://github.com/freifunk/icvpn
    - target: /etc/tinc/icvpn

/etc/tinc/icvpn/.git/hooks/post-merge:
  file.symlink:
    - target: /etc/tinc/icvpn/scripts/post-merge
    - force: True
    - makedirs: True

  cmd.script:
    - shell: /bin/bash
    - cwd: /etc/tinc/icvpn
    - require:
      - file: /etc/tinc/icvpn/tinc.conf



# ICVPN: host configuration
#
/etc/tinc/icvpn/tinc.conf:
  file.managed:
    - name: /etc/tinc/icvpn/tinc.conf
    - user: root
    - group: root
    - mode: 660
    - source: salt://tinc/tinc.conf.tpl
    - template: jinja
    - require:
      - pkg: tinc
      - git: tinc.icvpn.repo

/etc/tinc/icvpn/rsa_key.priv:
  file.managed:
    - name: /etc/tinc/icvpn/rsa_key.priv
    - user: root
    - group: root
    - mode: 400
    - template: jinja
    - source: salt://tinc/rsa_key.priv.tpl
    - require:
      - pkg: tinc
      - git: tinc.icvpn.repo


# ICVPN: network configuration
#
/etc/tinc/icvpn/tinc-up:
  file.managed:
    - name: /etc/tinc/icvpn/tinc-up
    - user: root
    - group: root
    - mode: 755
    - source: salt://tinc/tinc-up
    - require:
      - pkg: tinc
      - git: tinc.icvpn.repo

/etc/tinc/icvpn/tinc-down:
  file.managed:
    - name: /etc/tinc/icvpn/tinc-down
    - user: root
    - group: root
    - mode: 755
    - source: salt://tinc/tinc-down
    - require:
      - pkg: tinc
      - git: tinc.icvpn.repo

/etc/network/interfaces.d/icvpn:
  file.managed:
    - name: /etc/network/interfaces.d/icvpn
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://tinc/icvpn.interfaces
    - require:
      - pkg: tinc

# Allow tinc traffic
#
tinc.ferm:
  file:
    - managed
    - name: /etc/ferm.d/10-tinc.conf
    - source: salt://tinc/ferm.conf.tpl
    - makedirs: True
    - template: jinja

# Enable process monitoring with Net-SNMP
#
tinc.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.tincd.conf
    - source: salt://tinc/netsnmp.proc.conf
    - makedirs: True
