# Create routing tables
#
/etc/iproute2/rt_tables:
  file.managed:
    - name: /etc/iproute2/rt_tables
    - user: root
    - group: root
    - mode: 644
    - source: salt://networking/rt_tables.gateway


# Script to add or delete routing rules
#
/etc/policyrouting.sh:
  file.managed:
    - name: /etc/policyrouting.sh
    - user: root
    - group: root
    - mode: 755
    - source: salt://networking/policyrouting.sh.tpl
    - template: jinja

# Systemd unit to add or delete routing rules
#
/etc/systemd/system/policyrouting.service:
  file.managed:
    - name: /etc/systemd/system/policyrouting.service
    - user: root
    - group: root
    - mode: 755
    - source: salt://networking/policyrouting.service

  service.running:
    - name: policyrouting.service
    - enable: True
    - requires:
      - file: /etc/systemd/system/policyrouting.service
      - file: /etc/policyrouting.sh
    - watch:
      - file: /etc/systemd/system/policyrouting.service
      - file: /etc/policyrouting.sh
