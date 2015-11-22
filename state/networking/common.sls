# Add fffd.bat mesh interface
#
/etc/network/interfaces.d/fffd.bat:
  file.managed:
    - name: /etc/network/interfaces.d/fffd.bat
    - user: root
    - group: root
    - mode: 640
    - source: salt://networking/fffd.bat.tpl
    - template: jinja


# Set a dns resolver
#
resolv.conf:
  file.managed:
    - name: /etc/resolv.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://networking/resolv.conf.tpl
    - template: jinja

