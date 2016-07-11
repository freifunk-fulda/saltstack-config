# Install forwarding, mangle and nat rules
# 
ferm.mangle.conf:
  file.managed:
    - name: /etc/ferm.d/81-mangle.conf
    - source: salt://ferm/files/81-mangle.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - template: jinja

ferm.nat.conf:
  file.managed:
    - name: /etc/ferm.d/82-nat.conf
    - source: salt://ferm/files/82-nat.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - template: jinja

ferm.forward.ipv4.conf:
  file.managed:
    - name: /etc/ferm.d/85-forward.ipv4.conf
    - source: salt://ferm/files/85-forward.ipv4.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - template: jinja

ferm.forward.ipv6.conf:
  file.managed:
    - name: /etc/ferm.d/85-forward.ipv6.conf
    - source: salt://ferm/files/85-forward.ipv6.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - template: jinja
