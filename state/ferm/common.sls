# Install and start ferm
#
ferm.common:
  pkg.installed:
    - name: ferm

  service.running:
    - name: ferm
    - reload: True
    - require:
      - pkg: ferm.common
    - watch:
      - file: /etc/ferm/ferm.conf
      - file: /etc/ferm.d/*


# Install ferm default configuration
#
ferm.default:
  file:
    - managed
    - name: /etc/default/ferm
    - source: salt://ferm/ferm.default
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

ferm.conf:
  file:
    - managed
    - name: /etc/ferm/ferm.conf
    - source: salt://ferm/ferm.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True


# Install common IPv4 and IPv6 firewall rules
#
ferm.ipv4.conf:
  file:
    - managed
    - name: /etc/ferm.d/00-ipv4-default.conf
    - source: salt://ferm/ferm.ipv4.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

ferm.ipv6.conf:
  file:
    - managed
    - name: /etc/ferm.d/00-ipv6-default.conf
    - source: salt://ferm/ferm.ipv6.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True


# Install explicite DROP policy
#
ferm.drop:
  file:
    - managed
    - name: /etc/ferm.d/98-drop.conf
    - source: salt://ferm/98-drop.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True


# Install hook to restart fail2ban after restarting ferm
# (disabled at the moment as the use of fail2ban is questionable)
#
ferm.hooks:
  file:
    - managed
    - name: /etc/ferm.d/99-hooks.conf
    - source: salt://ferm/99-hooks.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

ferm.restart.fail2ban:
  file:
    - managed
    - name: /etc/fail2ban/restart_after_ferm_restart.sh
    - source: salt://ferm/restart_fail2ban.sh
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

