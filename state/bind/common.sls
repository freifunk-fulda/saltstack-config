# Install and enable bind9
#
bind9:
  pkg.installed:
    - name: bind9

  service.running:
    - name: bind9
    - enable: True
    - watch:
      - file: /etc/bind/named.conf
      - file: /etc/bind/named.conf.*


# bind9 configuration
#
bind9.named.conf:
  file.managed:
    - name: /etc/bind/named.conf
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/files/named.conf.tpl
    - template: jinja

bind9.named.conf.options:
  file.managed:
    - name: /etc/bind/named.conf.options
    - user: root
    - group: bind
    - mode: 640
    - source: salt://bind/files/named.conf.options.tpl
    - template: jinja
