ffrl:
  iface: ffrl-dummy
  ipv6:
    network: '2a03:2260:100f:0100::'
    netmask: 56

  peers:
    endpoints:
      ffrl-a-dus: 185.66.193.0
      ffrl-b-dus: 185.66.193.1
      ffrl-a-fra: 185.66.194.0
      ffrl-b-fra: 185.66.194.1
      ffrl-a-ber: 185.66.195.0
      ffrl-b-ber: 185.66.195.1

  gw02:
    mac: de:df:02:c0:e7:52
    ipv4:
      address: 185.66.194.68
      mask: 32

    peers:
      ffrl-a-ber:
        tun4:
          remote: 100.64.5.110
          self: 100.64.5.111
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2b7::1
          self: 2a03:2260:0:2b7::2
          mask: 64

      ffrl-b-ber:
        tun4:
          remote: 100.64.5.116
          self: 100.64.5.117
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2ba::1
          self: 2a03:2260:0:2ba::2
          mask: 64

      ffrl-a-dus:
        tun4:
          remote: 100.64.5.114
          self: 100.64.5.115
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2b9::1
          self: 2a03:2260:0:2b9::2
          mask: 64

      ffrl-b-dus:
        tun4:
          remote: 100.64.5.120
          self: 100.64.5.121
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2bc::1
          self: 2a03:2260:0:2bc::2
          mask: 64

      ffrl-a-fra:
        tun4:
          remote: 100.64.5.112
          self: 100.64.5.113
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2b8::1
          self: 2a03:2260:0:2b8::2
          mask: 64

      ffrl-b-fra:
        tun4:
          remote: 100.64.5.118
          self: 100.64.5.119
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2bb::1
          self: 2a03:2260:0:2bb::2
          mask: 64

  gw03:
    mac: c2:3b:0a:6e:dc:08
    ipv4:
      address: 185.66.193.120
      mask: 32

    peers:
      ffrl-a-ber:
        tun4:
          remote: 100.64.7.152
          self: 100.64.7.153
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:3e8::1
          self: 2a03:2260:0:3e8::2
          mask: 64

      ffrl-b-ber:
        tun4:
          remote: 100.64.7.158
          self: 100.64.7.159
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:3eb::1
          self: 2a03:2260:0:3eb::2
          mask: 64

      ffrl-a-dus:
        tun4:
          remote: 100.64.7.156
          self: 100.64.7.157
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:3ea::1
          self: 2a03:2260:0:3ea::2
          mask: 64

      ffrl-b-dus:
        tun4:
          remote: 100.64.7.162
          self: 100.64.7.163
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:3ed::1
          self: 2a03:2260:0:3ed::2
          mask: 64

      ffrl-a-fra:
        tun4:
          remote: 100.64.7.154
          self: 100.64.7.155
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:3e9::1
          self: 2a03:2260:0:3e9::2
          mask: 64

      ffrl-b-fra:
        tun4:
          remote: 100.64.7.160
          self: 100.64.7.161
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:3ec::1
          self: 2a03:2260:0:3ec::2
          mask: 64

  gw04:
    mac: fe:cd:e4:3d:03:a3
    ipv4:
      address: 185.66.194.69
      mask: 32

    peers:
      ffrl-a-ber:
        tun4:
          remote: 100.64.5.122
          self: 100.64.5.123
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2bd::1
          self: 2a03:2260:0:2bd::2
          mask: 64

      ffrl-b-ber:
        tun4:
          remote: 100.64.5.128
          self: 100.64.5.129
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2c0::1
          self: 2a03:2260:0:2c0::2
          mask: 64

      ffrl-a-dus:
        tun4:
          remote: 100.64.5.126
          self: 100.64.5.127
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2bf::1
          self: 2a03:2260:0:2bf::2
          mask: 64

      ffrl-b-dus:
        tun4:
          remote: 100.64.5.132
          self: 100.64.5.133
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2c2::1
          self: 2a03:2260:0:2c2::2
          mask: 64

      ffrl-a-fra:
        tun4:
          remote: 100.64.5.124
          self: 100.64.5.125
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2be::1
          self: 2a03:2260:0:2be::2
          mask: 64

      ffrl-b-fra:
        tun4:
          remote: 100.64.5.130
          self: 100.64.5.131
          mask: 255.255.255.254
        tun6:
          remote: 2a03:2260:0:2c1::1
          self: 2a03:2260:0:2c1::2
          mask: 64
