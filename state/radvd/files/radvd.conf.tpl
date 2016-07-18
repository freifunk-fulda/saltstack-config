# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# Freifunk Fulda - IPv6 autoconfiguration

interface fffd.bat {
  AdvSendAdvert on;
#  AdvLinkMTU 1280;
  MaxRtrAdvInterval 200;

  prefix fd00:65a8:93a4::/64 {
    AdvOnLink on;
    AdvAutonomous on;
    AdvRouterAddr on;
  };

  prefix {{ pillar.ffrl.ipv6.network }}/64 {
    AdvOnLink on;
    AdvAutonomous on;
    AdvRouterAddr on;
  };

  RDNSS {{ pillar['ffrl']['ipv6']['network'] }}{{ pillar.hosts[grains.id].id }} {
  };
};

