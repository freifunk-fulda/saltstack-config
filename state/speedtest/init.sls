# perform speedtests

speedtest-cli:
  pip.installed:
    - require:
      - pkg: tools

speedtest.cron:
  cron.present:
    - name: /opt/fffd-utils/speedtest.py -i {{ pillar.hosts[grains['id']].ipv4.freifunk }}
    - user: root
    - minute: 0,15,30,45
    - require:
      - git: fffd-utils.repo

