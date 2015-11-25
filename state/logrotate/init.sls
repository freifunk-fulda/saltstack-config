# Install logrotate
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
    - source: salt://logrotate/logrotate.conf
    - require:
      - pkg: logrotate

logrotate.apache2.conf:
  file.managed:
    - name: /etc/logrotate.d/apache2
    - user: root
    - group: root
    - mode: 644
    - source: salt://logrotate/apache2.conf
    - require:
      - pkg: logrotate

logrotate.rsyslog.conf:
  file.managed:
    - name: /etc/logrotate.d/rsyslog
    - user: root
    - group: root
    - mode: 644
    - source: salt://logrotate/rsyslog.conf
    - require:
      - pkg: logrotate
