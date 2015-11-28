hosts:
  gw01:
    id: 1
    enabled: 1
    debug: 0
    location: Hetzner, Frankfurt
    mac: 26:13:9d:b4:31:a7
    ipv4:
      public: 176.9.72.29
      freifunk: 10.185.0.1
      icvpn: 10.207.0.32
    ipv6:
      public: 2a01:4f8:151:204::fffd
      freifunk: fd00:65a8:93a4::1
      icvpn: fec0::a:cf:0:20

  gw02:
    id: 2
    enabled: 0
    debug: 0
    location: Netcup, Frankfurt
    mac: 26:13:9d:75:c2:51
    ipv4:
      public: 46.38.238.133
      freifunk: 10.185.0.2
      icvpn: 10.207.0.29
    ipv6:
      public: 2a03:4000:2:4fc::fffd
      freifunk: fd00:65a8:93a4::2
      icvpn: fec0::a:cf:0:1d

  gw03:
    id: 3
    enabled: 1
    debug: 0
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
