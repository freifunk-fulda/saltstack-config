# Set default sysctl values
#
/etc/sysctl.d/10-default.conf:
  file:
    - managed
    - name: /etc/sysctl.d/10-default.conf
    - source: salt://sysctl/10-default.conf
    - makedirs: True


# Set gateway values (i.e., enable packet forwarding)
#
{% if grains['id'].startswith('gw') %}
/etc/sysctl.d/20-freifunk-gw.conf:
  file:
    - managed
    - name: /etc/sysctl.d/20-freifunk-gw.conf
    - source: salt://sysctl/20-freifunk-gw.conf
    - makedirs: True
{% endif %}
