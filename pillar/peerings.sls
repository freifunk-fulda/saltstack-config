# Peering configuration
# We allow peering in icvpn using bgp over tinc (type: icvpn) or
# the new and improved icevpn using bgp over gre/ip6gre (type: ice)

peerings:
  gw01:
    type: icvpn

  gw02:
    type: ice
    peers:
      dn42_major:
        as: 4242422600
        proto: ip6gre
        ttl: 128
        mtu: 1400
        keyexchange: ikev1
        ike: aes128-sha256-modp2048!
        esp: aes128-sha1-modp2048!
        remote: 2a02:c200::10:3:0:5324:42
        tun4:
          mask: 255.255.255.252
          left: 172.20.240.134
          right: 172.20.240.133
        tun6:
          mask: 64
          left: fe80::2
          right: fe80::1
        rightrsasigkey: |
          -----BEGIN PUBLIC KEY-----
          MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAyNsW6I5uAzxjt8E10x1c
          b59AtEeU4SC+FZyu1CKoRyVVsQkdLL42JZlpoSF99B740Z2KWWxaMY0cg9oSy1d1
          T6XQ92Exm01aEqrxys0mF7i+rkmjFGuXdoOANb3bAlJy1N84aD8z+crxzH0nwHCi
          rcKHCAOUSv40dmRZW6FJlh/+R1xBVSp7CPUfSeferTyeZ+JswawTT7r2ZTNnMka+
          8IjBRiEFRVq7D0kF7prBuaWXWl1iSB1UiUdh/SVtX8MC/BASkgcFT+g+Z5yn8LkO
          yOZ1CVIF6+AoW94E+65SK7WSJShIlzWsc1Uh5nw0F9a1Mo29ToeV2GRfT6q/pDT/
          oqpXB8NhrIMlNLIK6rDEmBW/VCUij/vaGWsEe/f1uFX5h9SvFCYPRdWw0JntqgwR
          eagKwIX+4lEXHChb3FkEfPNIAiRr2rRxDxBGyM8kxPBNfIVdAkTqqNEPPacdI27I
          oC6klzpOsNojD5oThYfagAp2dAZc2K8cZ2fB1UFDGrcVi6krP3MTwVbVOt62a0n0
          kAQJhJWPsxBvhSbCehkiWLdLRUIWdUCZfOFeADA5+QNIvmf2vpWiiiXD9Xdd+4bu
          cPjFuUwmI2Wo2D1VYUXkoYOkeOlPfv2YiPzBPoBw2vGUXRlNI4/z0HgJnAj1/ULz
          lXi8ZcGYXA1j9+zgkwVT7F8CAwEAAQ==
          -----END PUBLIC KEY-----

  gw03:
    type: icvpn
