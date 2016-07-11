# Install and enable apache2 modules needed on gateways.
# Requires installation of apache2 from apache2.common state
#
apache2.gateway:
  pkg.latest:
    - pkgs: 
      - libapache2-mod-wsgi
      - python-bottle
    - require:
      - pkg: apache2.common

  service.running:
    - name: apache2
    - enable: True
    - watch:
      - file: /etc/apache2/*

apache2.gateway.wsgi:
  apache_module.enable:
    - name: ssl
    - require:
      - pkg: apache2.gateway


# default websites (http and https)
# Add configuration files and enable the vhosts
#
vhost.default.conf:
  file.managed:
    - name: /etc/apache2/sites-available/000-default.conf
    - user: root
    - group: www-data
    - mode: 440
    - source: salt://apache2/files/gateway.vhost.tpl
    - template: jinja
    - require:
      - pkg: apache2.gateway

vhost.default.symlink:
  file.symlink:
    - name: /etc/apache2/sites-enabled/000-default.conf
    - target: /etc/apache2/sites-available/000-default.conf

vhost.default.ssl.conf:
  file.managed:
    - name: /etc/apache2/sites-available/000-default-ssl.conf
    - user: root
    - group: www-data
    - mode: 640
    - source: salt://apache2/files/gateway.vhost.ssl.tpl
    - template: jinja
    - require:
      - pkg: apache2.gateway

vhost.default.ssl.symlink:
  file.symlink:
    - name: /etc/apache2/sites-enabled/000-default-ssl.conf
    - target: /etc/apache2/sites-available/000-default-ssl.conf


# Install the keyupload tool from git
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
    - source: salt://apache2/files/fffd-keyupload.sudoers


# Enable collection of statistics data
#
vhost.vnstat.cron:
  file.managed:
    - name: /etc/cron.d/vnstat
    - user: root
    - group: root
    - mode: 755
    - source: salt://apache2/files/vnstat.cron
    - require:
      - pkg: apache2.gateway
