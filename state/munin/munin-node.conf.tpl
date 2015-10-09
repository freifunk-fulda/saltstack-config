# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# config-file for munin-node

log_level 4
log_file /var/log/munin/munin-node.log
pid_file /var/run/munin/munin-node.pid

background 1
setsid 1

# User and group to run as
#
user root
group root

# Timeout for the whole transaction (default 15 min)
# and for each plugin (default 1 min)
#
global_timeout 120
timeout 10

# Regexps for files to ignore
#
ignore_file [\#~]$
ignore_file DEADJOE$
ignore_file \.bak$
ignore_file %$
ignore_file \.dpkg-(tmp|new|old|dist)$
ignore_file \.rpm(save|new)$
ignore_file \.pod$

# Set this if the client doesn't report the correct hostname when
# telnetting to localhost, port 4949
#
#host_name localhost.localdomain

# A list of addresses that are allowed to connect. 
#
allow 10\.185\.0\.12$
allow 178\.238\.227\.172$

# Which address to bind to;
#
#host {{ pillar['hosts'][grains['id']]['ipv4']['freifunk'] }}
host *

# And which port
#
port 4949

