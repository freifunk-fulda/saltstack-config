# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# bind9 - zone configuration
# all gateways are slave dns servers


# old zones
#
zone "fffd" {
       type slave;
       masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
       file "/opt/fffd-dns/zones/db.fffd";
};

zone "services.fffd" {
       type slave;
       masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
       file "/opt/fffd-dns/zones/db.services.fffd";
};


# new zones
#
zone "fffd.eu" {
       type slave;
       masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
       file "/opt/fffd-dns/zones/db.fffd.eu";
};

zone "services.fffd.eu" {
       type slave;
       masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
       file "/opt/fffd-dns/zones/db.services.fffd.eu";
};

zone "nodes.fffd.eu" {
       type slave;
       masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
       file "/opt/fffd-dns/zones/db.nodes.fffd.eu";
};


# reverse zones
#
zone "185.10.in-addr.arpa" {
       type slave;
       masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
       file "/opt/fffd-dns/zones/185.10.in-addr.arpa";
};

zone "0.0.0.0.4.a.3.9.8.a.5.6.0.0.d.f.ip6.arpa" {
        type slave;
        masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
        file "/opt/fffd-dns/zones/0.0.0.0.4.a.3.9.8.a.5.6.0.0.d.f.ip6.arpa";
};
