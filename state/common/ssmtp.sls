ssmtp:
  pkg.installed:
    - name: ssmtp

  file.managed:
    - name: /etc/ssmtp/ssmtp.conf
    - source: salt://common/files/ssmtp.conf.tpl
    - template: jinja
    - makedirs: True

