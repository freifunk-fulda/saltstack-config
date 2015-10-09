# Get the fffd-utils repo
# (contains various scripts and cronjobs)
#
fffd-utils.repo:
  git.latest:
    - name: https://github.com/freifunk-fulda/fffd-utils.git
    - target: /opt/fffd-utils

# Disabled until all gateways are managed by saltstack
# We need to run a different script on gw03 at the moment
#
#check_gateway.cron:
#  file.symlink:
#    - name: /etc/cron.d/check_gateway
#    - target: /opt/fffd-utils/check_gateway.cron
#    - require:
#      - git: fffd-utils.repo
#      - pkg: openvpn

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

