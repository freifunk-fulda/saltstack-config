DEBUG=False
LOG_FILE="/var/log/lg-proxy.log"
LOG_LEVEL="WARNING"
ACCESS_LIST = ["10.185.0.11","5.45.103.39"]
IPV4_SOURCE="{{ pillar['hosts'][grains['id']]['ipv4']['freifunk'] }}"
IPV6_SOURCE="{{ pillar['hosts'][grains['id']]['ipv6']['freifunk'] }}"

