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


# Create routing tables
#
/etc/iproute2/rt_tables:
  file.managed:
    - name: /etc/iproute2/rt_tables
    - user: root
    - group: root
    - mode: 644
    - source: salt://networking/rt_tables


# Add routing rules
# (needs a better solution)
#
/etc/rc.local:
  file.managed:
    - name: /etc/rc.local
    - user: root
    - group: root
    - mode: 755
    - source: salt://networking/rc.local
