hosts:
  testgw01:
    id: 1
    enabled: 1
    location: gw01
    mac: 00:00:ff:fd:01:01
    ipv4:
      public: 192.168.100.101
      freifunk: 10.185.0.1
      icvpn: 
    ipv6:
      public: 
      freifunk: fd00:fffd:fffd::1
      icvpn: 

  testgw02:
    id: 2
    enabled: 1
    location: gw02
    mac: 00:00:ff:fd:01:02
    ipv4:
      public: 192.168.100.102
      freifunk: 10.185.0.2
      icvpn: 
    ipv6:
      public: 
      freifunk: fd00:fffd:fffd::2
      icvpn: 

