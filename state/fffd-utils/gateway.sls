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

