hosts:
  gw01:
    id: 1
    enabled: 1
    location: Hetzner, Frankfurt
    mac: 00:00:ff:fd:00:01
    ipv4:
      public: 176.9.72.29
      freifunk: 10.185.0.1
      icvpn: 10.207.0.21
    ipv6:
      public: 
      freifunk: fd00:fffd:fffd::1
      icvpn: fec0::a:cf:0:15

  gw02:
    id: 2
    enabled: 1
    location: Netcup, Frankfurt
    mac: 00:00:ff:fd:00:02
    ipv4:
      public: 46.38.238.133
      freifunk: 10.185.0.2
      icvpn: 10.207.0.27
    ipv6:
      public: 2a03:4000:2:4fc::fffd
      freifunk: fd00:fffd:fffd::2
      icvpn: fec0::a:cf:0:1b

  gw03:
    id: 3
    enabled: 1
    location: Netcup, Frankfurt
    mac: 26:13:9d:ea:e1:1b
    ipv4:
      public: 5.45.97.58 
      freifunk: 10.185.0.3
      icvpn: 10.207.0.42
    ipv6:
      public: 2a03:4000:5:144::fffd
      freifunk: fd00:65a8:93a4:0::3
      icvpn: fec0::a:cf:0:2a
