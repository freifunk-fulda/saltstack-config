# include common configuration
#
include:
  - fffd-utils.common


# depending on the peering type (ICVPN or ICE) this script will create our
# tinc and bird peer configuration, ROA and DNS delegations.
#
# however, first we need to ensure that the icvpn-meta and icvpn-scripts
# repositories exist.
#
{% if pillar.peerings[grains['id']].type != "none" %}
icvpn-meta.repo:
  git.latest:
    - name: https://github.com/freifunk/icvpn-meta
    - target: /opt/icvpn-meta

icvpn-scripts.repo:
  git.latest:
    - name: https://github.com/freifunk/icvpn-scripts
    - target: /opt/icvpn-scripts

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

