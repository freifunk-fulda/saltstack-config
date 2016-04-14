ffrl:
  gw02:
    iface:
      name: dummy-ffrl-nat
      mac: 6d:57:ae:6b:e2:c6
    ipv4: 
      address: 185.66.194.68
      mask: 255.255.255.254
    ipv6:
      network: "2a03:2260:100f:2::"
      mask: 64

    peers:
      bb-a.ak.ber:
        endpoint: 185.66.195.0
        tun4:
          remote: 100.64.5.110
          self: 100.64.5.111
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2b7::1
          self: 2a03:2260:0:2b7::2
          mask: 64

      bb-b.ak.ber:
        endpoint: 185.66.195.1
        tun4:
          remote: 100.64.5.116
          self: 100.64.5.117
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2ba::1
          self: 2a03:2260:0:2ba::2
          mask: 64

      bb-a.ix.dus:
        endpoint: 185.66.193.0
        tun4: 
          remote: 100.64.5.114
          self: 100.64.5.115
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2b9::1
          self: 2a03:2260:0:2b9::2
          mask: 64

      bb-b.ix.dus:
        endpoint: 185.66.193.1
        tun4:
          remote: 100.64.5.120
          self: 100.64.5.121
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2bc::1
          self: 2a03:2260:0:2bc::2
          mask: 64

      bb-a.fra3.fra:
        endpoint: 185.66.194.0
        tun4:
          remote: 100.64.5.112
          self: 100.64.5.113
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2b8::1
          self: 2a03:2260:0:2b8::2
          mask: 64

      bb-b.fra3.fra:
        endpoint: 185.66.194.1
        tun4:
          remote: 100.64.5.118
          self: 100.64.5.119
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2bb::1
          self: 2a03:2260:0:2bb::2
          mask: 64

  gw04:
    iface:
      name: dummy-ffrl-nat
      mac: d8:1f:e6:31:12:0d
    ipv4: 
      address: 185.66.194.69
      mask: 255.255.255.254
    ipv6:
      network: "2a03:2260:100f:4::"
      mask: 64

    peers:
      bb-a.ak.ber:
        endpoint: 185.66.195.0
        tun4:
          remote: 100.64.5.122
          self: 100.64.5.123
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2bd::1
          self: 2a03:2260:0:2bd::2
          mask: 64

      bb-b.ak.ber:
        endpoint: 185.66.195.1
        tun4:
          remote: 100.64.5.128
          self: 100.64.5.129
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2c0::1
          self: 2a03:2260:0:2c0::2
          mask: 64

      bb-a.ix.dus:
        endpoint: 185.66.193.0
        tun4: 
          remote: 100.64.5.126
          self: 100.64.5.127
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2bf::1
          self: 2a03:2260:0:2bf::2
          mask: 64

      bb-b.ix.dus:
        endpoint: 185.66.193.1
        tun4:
          remote: 100.64.5.132
          self: 100.64.5.133
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2c2::1
          self: 2a03:2260:0:2c2::2
          mask: 64

      bb-a.fra3.fra:
        endpoint: 185.66.194.0
        tun4:
          remote: 100.64.5.124
          self: 100.64.5.125
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2be::1
          self: 2a03:2260:0:2be::2
          mask: 64

      bb-b.fra3.fra:
        endpoint: 185.66.194.1
        tun4:
          remote: 100.64.5.130
          self: 100.64.5.131
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2c1::1
          self: 2a03:2260:0:2c1::2
          mask: 64

