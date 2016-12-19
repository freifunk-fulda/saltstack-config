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
    - source: salt://networking/files/30-gre-fffd.conf.tpl
    - makedirs: True
    - template: jinja
