# Create routing tables
#
/etc/iproute2/rt_tables:
  file.managed:
    - name: /etc/iproute2/rt_tables
    - user: root
    - group: root
    - mode: 644
    - source: salt://networking/files/rt_tables.gateway


# Script to add or delete routing rules
#
/etc/policyrouting.sh:
  file.managed:
    - name: /etc/policyrouting.sh
    - user: root
    - group: root
    - mode: 755
    - source: salt://networking/files/policyrouting.sh.tpl
    - template: jinja

# Systemd unit to add or delete routing rules
#
/etc/systemd/system/policyrouting.service:
  file.managed:
    - name: /etc/systemd/system/policyrouting.service
    - user: root
    - group: root
    - mode: 755
    - source: salt://networking/files/policyrouting.service

  service.running:
    - name: policyrouting
    - enable: True
    - requires:
      - file: /etc/systemd/system/policyrouting.service
      - file: /etc/policyrouting.sh
    - watch:
      - file: /etc/systemd/system/policyrouting.service
      - file: /etc/policyrouting.sh


# GRE tunnel for gateway interconnect
#
{% for gw in pillar['hosts'].keys() if gw != grains['id'] and gw.startswith('gw') and pillar['hosts'][gw]['enabled'] -%}
/etc/network/interfaces.d/tun-fffd-{{ gw }}:
  file.managed:
    - name: /etc/network/interfaces.d/tun-fffd-{{ gw }}
    - user: root
    - group: root
    - mode: 644
    - source: salt://networking/files/tun-fffd-.tpl
    - template: jinja
    - context:
        gw: {{ gw }}
{% endfor -%}

fffd.gre.ferm:
  file:
    - managed
    - name: /etc/ferm.d/30-gre-fffd.conf
    - source: salt://networking/files/ferm.conf.tpl
    - makedirs: True
    - template: jinja

