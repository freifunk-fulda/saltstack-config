# Load gre kernel modules
#
ip6_gre:
  kmod.present:
    - persist: True

gre:
  kmod.present:
    - persist: True


# Add tunnel interfaces
#
{% for peer in pillar.peerings[grains['id']].peers.keys() -%}
/etc/network/interfaces.d/tun-{{ peer }}:
  file.managed:
    - name: /etc/network/interfaces.d/tun-{{ peer }}
    - user: root
    - group: root
    - mode: 640
    - source: salt://ice/gre/tun-.tpl
    - template: jinja
    - context:
        peer: {{ peer }}
{% endfor -%}


gre.ferm:
  file:
    - managed
    - name: /etc/ferm.d/30-gre.conf
    - source: salt://ice/gre/ferm.conf.tpl
    - makedirs: True
    - template: jinja



