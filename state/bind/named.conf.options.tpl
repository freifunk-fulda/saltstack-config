# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# bind9 configuration

options {
	directory "/var/cache/bind";
	
	dnssec-validation no;
	
	recursion yes;
	allow-recursion { localnets; localhost; };
	
	auth-nxdomain no;    # conform to RFC1035
	listen-on-v6 { {{ pillar['hosts'][grains['id']]['ipv6']['freifunk'] }}; };    # ipv6 des gateway
	listen-on { 127.0.0.1; {{ pillar['hosts'][grains['id']]['ipv4']['freifunk'] }}; };   # localhost und ipv4 des gateway
	
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
