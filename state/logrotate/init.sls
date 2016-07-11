# Install and configure logrotate
#
logrotate:
  pkg.installed


# Configure logrotate
#
logrotate.conf:
  file.managed:
    - name: /etc/logrotate.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://logrotate/files/logrotate.conf

logrotate.apache2.conf:
  file.managed:
    - name: /etc/logrotate.d/apache2
    - user: root
    - group: root
    - mode: 644
    - source: salt://logrotate/files/apache2.conf

logrotate.rsyslog.conf:
  file.managed:
    - name: /etc/logrotate.d/rsyslog
    - user: root
    - group: root
    - mode: 644
    - source: salt://logrotate/files/rsyslog.conf
