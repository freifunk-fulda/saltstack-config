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
    type: ice
    self:
      private: |
        -----BEGIN PGP MESSAGE-----
        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
        =tevJ
        -----END PGP MESSAGE-----
      public: |
        -----BEGIN PUBLIC KEY-----
        MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAyHMEdfZKs3DsWwfn6WCz
        BLxZ/U0bGoZPv/wFeehHnPizofdhWW83gPM39Qhf+6NQhJElmdAmsiBv7bvqBOVd
        H4zdMwdRvkpUOBSoQkVzJmC20JCkW6O+lWR/4+4PcrxTaITUhwIoeTRU9N+JQf5W
        Eco6pPGQ4jFjPFFx0CS/LptaNm4lt1taharuI2Xhb+v/1/uSlg6kQ5jL6Xpvs1tu
        tM4gRaWPvoT+xCpJoOKCEAZFKS/Iki7tIDDDXn3siJsokVK2Uks3Ge02+qNHMKFl
        QSF6C+UcsDYFOTwiEgP3qyNYxZdGF+9lWVIjiu7Cq5PZFIqbUlMGt47hL03SnBDg
        pvV35D3bm89VTgYoR05aHI147pq3OTHLGcKM9WYKe19ojYg9Ya2ZPa43OhFnLVXG
        DsApyvX9qjiW7dhSQTZ9ihx0XwgfWYHejhzzktKYR+cL+pxFZ7tTZ756ZT7uw6jE
        NYMxRkqS+jIQTPtBgY1ZPB8vuPQfZA2RNOYV5WqGS/habJ3r9U8QjWH0P1qNNmXe
        dppOJMnIsEf+KJNM1lpTaVqs5Mm8YbgLRDBq68jUaO3/9BtH19iM17Wfc+L28bvX
        x4YmHTFvD2Tr507CL/gazBw3ZhNMT/n1bJV5mYOVRlxH4FctDaNn7w+KjymWiP4S
        RV2vpnX+YoDD2Qvwe7Ik6bMCAwEAAQ==
        -----END PUBLIC KEY-----


  gw03:
    type: none


  gw04:
    type: ice
    self: 
      private: |
        -----BEGIN PGP MESSAGE-----
        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
        =PjSc
        -----END PGP MESSAGE-----
      public: |
        -----BEGIN PUBLIC KEY-----
        MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAx8xDNb6O+x4OnXQ/7sI1
        pK2Kv7ItS3oltQTfXZxnbbXJ6oL0A3CBVW/RLb0cUaP03mL4iHehkkSH3U+TiJn8
        qCX7S/aGMXtFdPEbcLI+Pv6GDy7QVTA73U8eRyjpyWX+4cuFcQ4UiXQGs229v5WI
        v/7dGoMJfh359NtOaZRnT9rWkwch+5CUGqgZASfiqxnRkNZqyPFzziT7lLuCIu6a
        /B41xVG70a9hTIPH1S9yJTRIZnAUq91IdSUgYmyfealoaygKfnnlA/FZw5NTq698
        L1oc2/jID6nM8I6wBV02e+60eNs9G/S/BWvKBkU6uIVxM0YbUE7iIUimRLk+uSSj
        SFA1VCmRssTnZsek6fQt2ro0X6buMCVMH3uAze5/e5cb0mbLkDenNck9/Qfu3Adi
        FGMs53n15V9WF+AMTls1cAxYf08LlVRAblxSjxvUiVlZdIH8fmjHVx/shQzeol1D
        Bo5bj49L5VgXjonuFRWJZwWMZKBK1PAMxrPowm+g7Fqiy72wzWf68bIQcL0lDWx+
        0nvI0jTaIrWmEpxQKHE+0AZwK+pRM0XQ4wxxvgER/EGUZoPOjrGeAtOHGRxcBLOP
        HWKKHED3mnuRdzMrIpVJWFEX7uvZhQaSCct2QFEE42bvF7xLWcqZ9/5PzuU+uTqZ
        n3UgEGBK1ijSBOXfBM1J3ZMCAwEAAQ==
        -----END PUBLIC KEY-----

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


  srv1:
    type: none
