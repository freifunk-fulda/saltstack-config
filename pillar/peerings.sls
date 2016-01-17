# Peering configuration
# We allow peering in icvpn using bgp over tinc (type: icvpn) or
# the new and improved icevpn using bgp over gre/ip6gre (type: ice)

# Transfer Network: 172.20.241.0/24
# Usage:
#  - 172.20.241.0/30   dn42_andi
#  - 172.20.241.4/30   dn42_flokli
#  - 172.20.241.8/30   -
#  - 172.20.241.12/30  -


peerings:
  gw01:
    type: icvpn

  gw02:
    type: none

  gw03:
    type: icvpn

  gw04:
    type: ice
    peers:
      dn42_major:
        as: 4242422600
        proto: ip6gre
        ttl: 128
        mtu: 1400
        keyexchange: ikev2
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

      dn42_andi:
        as: 4242423991
        proto: ip6gre
        ttl: 128
        mtu: 1400
        keyexchange: ikev1
        ike: aes128-sha256-modp2048!
        esp: aes128-sha1-modp2048!
        remote: 2a01:4f8:201:6344::1
        tun4:
          mask: 255.255.255.252
          left: 172.20.241.1
          right: 172.20.241.2
        tun6:
          mask: 64
          left: fe80::1
          right: fe80::2
        rightrsasigkey: |
          -----BEGIN PUBLIC KEY-----
          MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAvbqA8Wm96TBEok8ScWbG
          x2RP3tmzsnBhOCToNA580EiHR96ckW3bvgbsEc70rc+NE4JKmdZRiRspkSizvBhP
          ddo7RKGszZkT0MZVrWdgvma6CJlvJxye/B0kZXGmcns1JLzSC0ctRB5qcJTitEkX
          ckao7ONUZ+8pjYH+FszK9FqEbOQHql1fLkdvZ42OJaML2mkcZ3trQbVpowcQ2cp4
          89hqSlDV0Bbu3cm7cfJjAiRCrjlFLyfDXZAi2/0eWJcF22QjT5L2q1f1eLpPx/9d
          mo/EdwmfdmW+vPrgWPArx4tyuyqd7ugsaBM5P3YiKawo7sGYwu53NXlH//BL33pE
          RzaAjpkuaJ0tdiWaeuKgB7eyE4DA6eY+k3b35PJujcm7iuRMUszum4UsPb66YLLg
          19OUoZSJ5697ipE/yEyMqkXurlS6xuHTxmZwmV8fQ2g3f1BiWDWJWGXs0Tci/lWS
          RWcPUwiSlDojXUkfprs71W4RV5T2/y5edX6MUaN9Sm6qv8grDE1lnv5F+67LSyPc
          AxRn6uTi+vyGlY4qVCDIZNHQBQ10GoBTvnOWJWydMcLur7MTCwvLdkDfpopXk2zE
          hd+KD1LPIKR0swsmSInyOZ0q4VuShw/HB7zs2a2GUHT3VFHJb7mKClooS6D5ZvIt
          hiK2h6mBeiycttM/F7q4pQkCAwEAAQ==
          -----END PUBLIC KEY-----

      dn42_flokli:
        as: 4242422100
        proto: ip6gre
        ttl: 128
        mtu: 1400
        keyexchange: ikev2
        ike: aes128-sha256-modp2048!
        esp: aes128-sha1-modp2048!
  
        remote: 2a01:4f8:171:7de::1
        tun4:
          left: 172.20.241.5
          right: 172.20.241.6
          mask: 255.255.255.252
        tun6:
          left: fe80::1
          right: fe80::2
          mask: 64
  
        rightrsasigkey: |
          -----BEGIN PUBLIC KEY-----
          MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAyUotBHkEAkVEVLDeUfBB
          u5AifCOWZ5m1v+OL1sb+LErUEcbT08G0ZHxi/CIC69Z74+mNhkS5nMP348wsPHeE
          6JqcLqlj0z3de+ctu+abBjuiVuwpgvIXO7QnUc6RQv9N1Hl/hc/VDj19zv9slNfO
          ovj7sVClUf/K6k+t3PNyJeyx4JIbcMbOSHSZ6kaOLqtPRHNCaQkPBDK2dBp8SIxh
          8U5RwyWCXP6XpTT5HbQo+d/mJC2vUjg1Uq/9GfHAhZgTO9TwOV1RksVmtMBkwZ4y
          P0kJ/0VFFMNhrZSVUcrDxhdcddX8Fp/iu4xtXaU7XlpqoWAyF5Aq3dEdcARxnOtp
          sDeH9ejqdaQImC7KZ59oPz8mJp/bjP9/SKJIcZYltM8RS8zE8F484Wznbg4Fpesp
          FMfnIWqAmFEhXK9pyqCCw9Aeu7brRktyyBtwmficHz/GP2S3TTVlqkJcjdnzqEsc
          K8XYqPuixgLtehsnPmdDZ2nuIJxSkBQJTj9SPDQB9jFtDKTI3TOEuA2fVZa+wKnL
          ALhvmFyLh5ClRCC5Se64BnrZ3iwTbcG+EI0rxVdZONFyUBHJluHIlHdxtZ1XA92p
          RMpm/dJNJXerIu35PcBbs+4evvMiYWvfZgQosYmscYfroFCQTV8GrFu//Mo2pTTy
          /TfeQ5bZsjZAgOk6vkZ6/fUCAwEAAQ==
          -----END PUBLIC KEY-----

