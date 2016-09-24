# Install and enable sshd
#
sshd:
  pkg.installed:
    - name: openssh-server

  service.running:
    - name: ssh
    - enable: True
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
    - source: salt://ssh/files/sshd_config
    - template: jinja


# Empty the authorized_keys file,
# and add ssh keys of admins
#
sshd.root.authorized_keys:
  file.managed:
    - name: /root/.ssh/authorized_keys
    - source: salt://ssh/files/authorized_keys.tpl
    - template: jinja

# Allow ssh traffic
#
sshd.ferm:
  file.managed:
    - name: /etc/ferm.d/50-sshd.conf
    - source: salt://ssh/files/ferm.ssh.conf.tpl
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
    - source: salt://ssh/files/start-after-tinc.systemd
    - makedirs: True
    - require:
      - pkg: openssh-server


# enable mosh
#
mosh:
  pkg.installed:
    - name: mosh

mosh.ferm:
  file.managed:
    - name: /etc/ferm.d/50-mosh.conf
    - source: salt://ssh/files/ferm.mosh.conf
    - makedirs: True

