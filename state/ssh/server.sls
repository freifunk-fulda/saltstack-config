# Install and enable sshd
#
sshd:
  pkg.installed:
    - name: openssh-server
  service.running:
    - name: ssh
    - enable: True
    - require:
      - pkg: openssh-server
    - watch:
      - file: /etc/ssh/sshd_config
      - file: /etc/systemd/system/ssh.service.d/want-tinc.conf

# sshd configuration
#
sshd.conf:
  file.managed:
    - name: /etc/ssh/sshd_config
    - user: root
    - group: root
    - mode: 640
    - source: salt://ssh/sshd_config
    - template: jinja
    - require:
      - pkg: openssh-server


# Add ssh keys od admins
#
{% for owner, key in pillar['ssh']['authorized_keys'].items() %}
sshd.root.authorized_keys.{{ owner }}:
  ssh_auth:
    - present
    - user: root
    - name: {{ key }}
    - comment: {{ owner }}
{% endfor %}


# Allow ssh traffic
#
sshd.ferm:
  file:
    - managed
    - name: /etc/ferm.d/50-sshd.conf
    - source: salt://ssh/ferm.conf.tpl
    - makedirs: True
    - template: jinja

# Ensure ssh starts after tinc, to allow to bind to the icvpn interface
#
start-after-tinc.systemd:
  file.managed:
    - name: /etc/systemd/system/ssh.service.d/want-tinc.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://ssh/start-after-tinc.systemd
    - makedirs: True
    - require:
      - pkg: openssh-server
