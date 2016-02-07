# Websites (http and https)
#
homepage.packages:
  pkg.installed:
    - pkgs:
      - php5
      - php5-mysql
      - php5-gd

vhost.dummy.conf:
  file.managed:
    - name: /etc/apache2/sites-available/dummy.conf
    - user: root
    - group: root
    - mode: 640
    - contents: ''

