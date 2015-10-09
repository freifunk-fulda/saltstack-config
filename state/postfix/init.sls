# Install and enable postfix
#
postfix.default:
  pkg.installed:
    - name: postfix

  service.running:
    - name: postfix
    - enable: True
    - require:
      - pkg: postfix
    - watch:
      - file: /etc/postfix/*


# Add minimal configuration
#
postfix.main.cf:
  file.managed:
    - name: /etc/postfix/main.cf
    - user: root
    - group: root
    - mode: 640
    - source: salt://postfix/main.cf.tpl
    - template: jinja
    - require:
      - pkg: postfix

postfix.mailname:
  file.managed:
    - name: /etc/mailname
    - user: root
    - group: root
    - mode: 640
    - source: salt://postfix/mailname.tpl
    - template: jinja
    - require:
      - pkg: postfix
