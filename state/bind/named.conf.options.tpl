# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# bind9 configuration

options {
	directory "/var/cache/bind";
	
	dnssec-enable no;
	dnssec-validation no;
	
	auth-nxdomain no;    # conform to RFC1035

	listen-on-v6 {
		::1;
		{{ pillar['hosts'][grains['id']]['ipv6']['freifunk'] }};

		# this is needed to get replys from other dns servers.
		# note: firewall only allows related answers
		{{ pillar['hosts'][grains['id']]['ipv6']['public'] }};
	};
	listen-on {
		127.0.0.1;
		{{ pillar['hosts'][grains['id']]['ipv4']['freifunk'] }};

		# this is needed to get replys from other dns servers.
		# note: firewall only allows related answers
		{{ pillar['hosts'][grains['id']]['ipv4']['public'] }};
	};

	allow-query { any; };

	recursion yes;
	allow-recursion {
		127.0.0.1/32;
		::1/128;

		10.185.0.0/16;
		fd00:fffd:fffd::/48;
		fd00:65a8:93a4::/48;
	};
	
	statistics-file "/var/cache/bind/named.stats";
};

## for debugging purposes only. do not enable in production!
##
#logging {
#       category "default" { "debug"; };
#       category "general" { "debug"; };
#       category "database" { "debug"; };
#       category "security" { "debug"; };
#       category "config" { "debug"; };
#       category "resolver" { "debug"; };
#       category "xfer-in" { "debug"; };
#       category "xfer-out" { "debug"; };
#       category "notify" { "debug"; };
#       category "client" { "debug"; };
#       category "unmatched" { "debug"; };
#       category "network" { "debug"; };
#       category "update" { "debug"; };
#       category "queries" { "debug"; };
#       category "dispatch" { "debug"; };
#       category "dnssec" { "debug"; };
#       category "lame-servers" { "debug"; };
#       channel "debug" {
#               file "/tmp/nameddbg" versions 2 size 50m;
#               print-time yes;
#               print-category yes;
#       };
#};
