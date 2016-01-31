// THIS FILE IS CONTROLLED BY SALTSTACK!


// old zones
zone "fffd" {
	type master;
	notify yes;
	allow-transfer { key "fffd-axfr-tsig"; };
	file "/opt/fffd-dns/zones/db.fffd";
};

zone "services.fffd" {
	type master;
	notify yes;
	allow-transfer { key "fffd-axfr-tsig"; };
	file "/opt/fffd-dns/zones/db.services.fffd";
};


// new zones
zone "fffd.eu" {
	type master;
	notify yes;
	allow-transfer { key "fffd-axfr-tsig"; };
	file "/opt/fffd-dns/zones/db.fffd.eu";
};

zone "services.fffd.eu" {
	type master;
	notify yes;
	allow-transfer { key "fffd-axfr-tsig"; };
	file "/opt/fffd-dns/zones/db.services.fffd.eu";
};

zone "nodes.fffd.eu" {
	type master;
	notify yes;
	allow-transfer { key "fffd-axfr-tsig"; };
	file "/var/lib/bind/zones/db.nodes.fffd.eu";
};


// reverse zones
zone "0.185.10.in-addr.arpa" {
	type master;
	notify yes;
	allow-transfer { key "fffd-axfr-tsig"; };
	file "/opt/fffd-dns/zones/0.185.10.in-addr.arpa";
};

zone "0.0.0.0.4.a.3.9.8.a.5.6.0.0.d.f.ip6.arpa" {
	type master;
	notify yes;
	allow-transfer { key "fffd-axfr-tsig"; };
	file "/opt/fffd-dns/zones/0.0.0.0.4.a.3.9.8.a.5.6.0.0.d.f.ip6.arpa";
};

