# Install and enable apache2
#
apache2.common:
  pkg.latest:
    - name: apache2

  service.running:
    - name: apache2
    - enable: True
    - watch:
      - file: /etc/apache2/*

apache2.common.ssl:
  apache_module.enable:
    - name: ssl
    - require:
      - pkg: apache2.common


# SSL key and certificate for the https website)
#
wildcard.fulda.freifunk.net.key:
  file.managed:
    - name: /etc/ssl/local/wildcard.fulda.freifunk.net.key
    - user: root
    - group: www-data
    - mode: 440
    - source: salt://apache2/files/wildcard.fulda.freifunk.net.key.tpl
    - template: jinja
    - makedirs: True
    - require:
      - pkg: apache2.common


# fulda.freifunk.net wildcard certificate
#
wildcard.fulda.freifunk.net.crt:
  file.managed:
    - name: /etc/ssl/local/wildcard.fulda.freifunk.net.crt
    - user: root
    - group: www-data
    - mode: 440
    - source: salt://apache2/files/wildcard.fulda.freifunk.net.crt
    - makedirs: True
    - require:
      - pkg: apache2.common

startcom.class2.server.crt:
  file.managed:
    - name: /etc/ssl/local/startcom.class2.server.crt
    - user: root
    - group: www-data
    - mode: 440
    - source: salt://apache2/files/startcom.class2.server.crt
    - makedirs: True
    - require:
      - pkg: apache2.common


# Firewall configuration
#
apache.ferm:
  file:
    - managed
    - name: /etc/ferm.d/50-www.conf
    - source: salt://apache2/files/50-www.conf
    - makedirs: True
    - require:
      - pkg: apache2.common
