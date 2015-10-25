# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# bind9 - zone configuration
# all gateways are slave dns servers


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

zone "nodes.fffd" {
       type slave;
       masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
       file "/opt/fffd-dns/zones/db.nodes.fffd";
};

zone "0.185.10.in-addr.arpa" {
       type slave;
       masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
       file "/opt/fffd-dns/zones/0.185.10.in-addr.arpa";
};

zone "0.0.0.0.d.f.f.f.d.f.f.f.0.0.d.f.ip6.arpa" {
        type slave;
        masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
        file "/opt/fffd-dns/zones/0.0.0.0.d.f.f.f.d.f.f.f.0.0.d.f.ip6.arpa";
};

zone "0.0.0.0.4.a.3.9.8.a.5.6.0.0.d.f.ip6.arpa" {
        type slave;
        masters { {{ pillar['bind']['master']['ipv4'] }}; {{ pillar['bind']['master']['ipv6'] }}; };
        file "/opt/fffd-dns/zones/0.0.0.0.4.a.3.9.8.a.5.6.0.0.d.f.ip6.arpa";
};

