# Websites (http and https)
#
vhost.dummy.conf:
  file.managed:
    - name: /etc/apache2/sites-available/dummy.conf
    - user: root
    - group: root
    - mode: 640
    - contents: ''

