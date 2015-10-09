# THIS FILE IS CONTROLLED BY SALTSTACK!
#
# Freifunk Fulda - Perfect-Privacy VPN Config
#
# Connection: {{connection}}

client

dev-type tun
dev fffd.internet

proto udp
tun-mtu 1500
fragment 1300

# Remote hosts
{%- for remote in pillar['openvpn']['perfectprivacy']['connections'][connection]['servers'] %}
remote {{remote}}
{% endfor %}

# Key material
cert perfectprivacy/{{connection}}.crt
key perfectprivacy/{{connection}}.key
tls-auth perfectprivacy/{{connection}}.ta 1
ca perfectprivacy/ca.crt
ns-cert-type server

# Data channel encryption and authentication
cipher AES-256-CBC

auth SHA512
auth-user-pass perfectprivacy/auth.txt

# Control channel security
tls-cipher DHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-CAMELLIA256-SHA:DHE-RSA-AES256-SHA:DHE-RSA-CAMELLIA128-SHA:DHE-RSA-AES128-SHA:CAMELLIA256-SHA:AES256-SHA:CAMELLIA128-SHA:AES128-SHA

tls-timeout 5
hand-window 120

# Keep trying indefinitely to resolve the host name of the OpenVPN server.
resolv-retry infinite

# Most clients don't need to bind to a specific local port number.
nobind

# Try to preserve some state across restarts.
persist-key
persist-tun

# Enable compression on the VPN link.
comp-lzo

# Set log file verbosity.
verb 3

# Keep alive settings
ping 5
ping-restart 120

# Allow calling of built-in executables and user-defined scripts.
script-security 2

# Update routing information.
# Do not use standard configuration pushed via DHCP!
route-noexec

remote-random
mssfix 
float
reneg-sec 3600
persist-remote-ip
inactive 604800
replay-window 512 60
mute-replay-warnings

