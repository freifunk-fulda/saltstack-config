mysql.server:
  pkg.installed:
    - pkgs:
      - mysql-server
      - mysql-client
      - python-mysqldb
  service.running:
    - enable: True
    - name: mysql
    - watch:
      - pkg: mysql.server

mysql.server.secure:
  mysql_user.present:
    - name: root
    - host: localhost
    - password: '{{ pillar['mysql']['password'] }}'
    - requires:
      - pkg: mysql.server
      - service: mysql.server

