# include common configuration
#
include:
  - fffd-utils.common


# Check uplink status and enable/disable gateway mode
#
check_gateway.cron:
  file.symlink:
    - name: /etc/cron.d/check_gateway
    - target: /opt/fffd-utils/check_gateway.cron
    - require:
      - git: fffd-utils.repo
      - pkg: openvpn

/etc/gateway_enabled:
  file.managed:
    - name: /etc/gateway_enabled
    - user: root
    - group: root
    - mode: 644
    - source: salt://fffd-utils/gateway_enabled
    - template: jinja
    - require:
      - git: fffd-utils.repo


# depending on the peering type (ICVPN or ICE) this script will create our
# tinc and bird peer configuration, ROA and DNS delegations.
#
{% if pillar.peerings[grains['id']].type != "none" %}
/etc/cron.hourly/update-icvpn:
  cron.present:
    - name: /opt/fffd-utils/update-icvpn.sh {{ pillar.peerings[grains['id']].type }}
    - user: root
    - minute: 0
    - hour: '*'
    - require:
      - git: fffd-utils.repo
      - file: /etc/bird/icvpn

  cmd.wait:
    - name: /opt/fffd-utils/update-icvpn.sh {{ pillar.peerings[grains['id']].type }}
    - shell: /bin/bash
    - env:
      - FORCE_VPN: "1"
      - FORCE_META: "1"
    - require:
      - git: fffd-utils.repo
    - watch:
      - git: fffd-utils.repo
{% endif %}

