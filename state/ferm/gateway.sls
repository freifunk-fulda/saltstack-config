# Install forwarding, mangle and nat rules
# 
ferm.mangle.ipv4.conf:
  file:
    - managed
    - name: /etc/ferm.d/81-mangle.ipv4.conf
    - source: salt://ferm/81-mangle.ipv4.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

ferm.nat.ipv4.conf:
  file:
    - managed
    - name: /etc/ferm.d/82-nat.ipv4.conf
    - source: salt://ferm/82-nat.ipv4.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

ferm.forward.ipv4.conf:
  file:
    - managed
    - name: /etc/ferm.d/85-forward.ipv4.conf
    - source: salt://ferm/85-forward.ipv4.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - template: jinja

ferm.forward.ipv6.conf:
  file:
    - managed
    - name: /etc/ferm.d/85-forward.ipv6.conf
    - source: salt://ferm/85-forward.ipv6.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - template: jinja

