# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# tinc configuration for icvpn peering

Name = fulda{{ pillar['hosts'][grains['id']]['id'] }}
PrivateKeyFile = /etc/tinc/icvpn/rsa_key.priv

Mode = Switch
PingTimeout = 30
Port = {{ pillar['tinc']['port'] }}
Hostnames = yes

# the following connect blocks are controlled by the post-merge git hook
# (see .git/hooks/post-merge)

