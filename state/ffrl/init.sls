# Load gre kernel modules
#
ffrl.ip6_gre:
  kmod.present:
    - name: ip6_gre
    - persist: True

ffrl.gre:
  kmod.present:
    - name: gre
    - persist: True


# Add dummy interface for NAT
#
/etc/network/interfaces.d/tun-{{ pillar.ffrl[grains['id']].iface.name }}:
  file.managed:
    - name: /etc/network/interfaces.d/{{ pillar.ffrl[grains['id']].iface.name }}
    - user: root
    - group: root
    - mode: 640
    - source: salt://ffrl/dummy.tpl
    - template: jinja


# Add tunnel interfaces
#
{% for peer in pillar.ffrl[grains['id']].peers.keys() -%}
/etc/network/interfaces.d/tun-{{ peer }}:
  file.managed:
    - name: /etc/network/interfaces.d/tun-{{ peer }}
    - user: root
    - group: root
    - mode: 640
    - source: salt://ffrl/tun-.tpl
    - template: jinja
    - context:
        peer: {{ peer }}
{% endfor -%}


ffrl.gre.ferm:
  file:
    - managed
    - name: /etc/ferm.d/30-gre-ffrl.conf
    - source: salt://ffrl/ferm.conf.tpl
    - makedirs: True
    - template: jinja



