# Install and enable apache2
#
apache2:
  pkg.installed:
    - pkgs: 
      - apache2
      - libapache2-mod-wsgi
      - python-bottle

  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: apache2
    - watch:
      - file: /etc/apache2/*

  apache_module.enable:
    - name: ssl
    - require:
      - pkg: apache2


# default websites (http and https)
#
vhost.default.conf:
  file.managed:
    - name: /etc/apache2/sites-available/000-default.conf
    - user: root
    - group: root
    - mode: 640
    - source: salt://apache2/gateway.vhost.tpl
    - template: jinja
    - require:
      - pkg: apache2

vhost.default.ssl.conf:
  file.managed:
    - name: /etc/apache2/sites-available/000-default-ssl.conf
    - user: root
    - group: root
    - mode: 640
    - source: salt://apache2/gateway.vhost.ssl.tpl
    - template: jinja
    - require:
      - pkg: apache2


# SSL key and certificate for the https website)
#
wildcard.fulda.freifunk.net.key:
  file.managed:
    - name: /etc/ssl/local/wildcard.fulda.freifunk.net.key
    - user: root
    - group: root
    - mode: 440
    - source: salt://apache2/wildcard.fulda.freifunk.net.key.tpl
    - template: jinja
    - makedirs: True
    - require:
      - pkg: apache2

wildcard.fulda.freifunk.net.crt:
  file.managed:
    - name: /etc/ssl/local/wildcard.fulda.freifunk.net.crt
    - user: root
    - group: root
    - mode: 440
    - source: salt://apache2/wildcard.fulda.freifunk.net.crt
    - makedirs: True
    - require:
      - pkg: apache2

startcom.class2.server.crt:
  file.managed:
    - name: /etc/ssl/local/startcom.class2.server.crt
    - user: root
    - group: root
    - mode: 440
    - source: salt://apache2/startcom.class2.server.crt
    - makedirs: True
    - require:
      - pkg: apache2


# Get website/keyupload repo
#
fffd-keyupload:
  git.latest:
    - name: https://github.com/freifunk-fulda/fffd-keyupload.git
    - target: /opt/fffd-keyupload

fffd-keyupload.log:
  file.managed:
    - name: /var/log/fffd-keyupload.log
    - user: root
    - group: www-data
    - mode: 660

fffd-keyupload.sudoers:
  file.managed:
    - name: /etc/sudoers.d/fffd-keyupload
    - user: root
    - group: root
    - mode: 660
    - source: salt://apache2/fffd-keyupload.sudoers


# statistics
#
vhost.vnstat.cron:
  file.managed:
    - name: /etc/cron.d/vnstat
    - user: root
    - group: root
    - mode: 755
    - source: salt://apache2/vnstat.cron
    - require:
      - pkg: apache2


apache.ferm:
  file:
    - managed
    - name: /etc/ferm.d/50-www.conf
    - source: salt://apache2/ferm.conf
    - makedirs: True

