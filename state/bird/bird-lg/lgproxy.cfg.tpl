DEBUG=False
LOG_FILE="/var/log/lg-proxy.log"
LOG_LEVEL="WARNING"
ACCESS_LIST = ["{{ pillar['hosts']['srv1']['ipv4']['freifunk'] }}","{{ pillar['hosts']['srv1']['ipv4']['public'] }}"]
IPV4_SOURCE="{{ pillar['hosts'][grains['id']]['ipv4']['freifunk'] }}"
IPV6_SOURCE="{{ pillar['hosts'][grains['id']]['ipv6']['freifunk'] }}"
BIRD_SOCKET="/var/run/bird/bird.ctl"
BIRD6_SOCKET="/var/run/bird/bird6.ctl"

