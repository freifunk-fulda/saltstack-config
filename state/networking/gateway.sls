# Create routing tables
#
/etc/iproute2/rt_tables:
  file.managed:
    - name: /etc/iproute2/rt_tables
    - user: root
    - group: root
    - mode: 644
    - source: salt://networking/rt_tables.gateway


# Add routing rules
# (needs a better solution)
#
/etc/rc.local:
  file.managed:
    - name: /etc/rc.local
    - user: root
    - group: root
    - mode: 755
    - source: salt://networking/rc.local.gateway
    - template: jinja


