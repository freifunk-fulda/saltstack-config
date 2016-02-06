root:
  password: |
    -----BEGIN PGP MESSAGE-----
    hQIMA9J7QslVEt/9ARAA2YXWIZbKiKsa04KCrWSvJjz1QhpZjz25H2yRn5ewQr/1
    6TJldYPZ9KkFyxFdI1YoncXIck29EI0H0qh9/03TZlP4BK8Q/w/xIE5WaroEuHaH
    s2TXoswIlRCimO+rtORO+SVPQBu9Wp640RkOV9R/aZ/h0FI5twupJFIl2IHYhV6S
    8JY0ucZMycYVqgGeuNGhqOhEq/Htx/1fG1J9IsXW0f8Ez5iwoYD5JxyyCYHy/3ps
    0wzlE13uHKaSJXv6CFW2bUleesnj85RRtehFx8wUD8CMUyqPiPvvnPV318paEESg
    g9owfmAeYXKohzDL3n2Vu3M2ptvKK+XrnY0yxRkAlbdAo/9h3CWUivnOs4i0HaT9
    YnKVLnAOMZ8nJHRO6+KKAQLc0hYSmN6yTYuJmaFBB9gVJsJIR6TMHzKJdt2ORP0V
    HrIfFQmX/RgY96sGT2r82kfbsOFpwrmeZ6VEQbBf0v/mL42to86kLUai7u7/Xl6h
    Kejzp+zWeaLn3A5CdrjREG7lYbYEadacUtWIB+jAGA3mXIKS1CTzpbb0CubE/EOb
    FHgZYgLjCONxT6FzVZ3uBZtSNblz9cHOOmRq0inI2o9z8mgqH5s0K6konA0rtxrI
    hK+NW01N/aN3jiqmyiv1M2b7ljehozpnnVwErMJUkm2SyqKhWt/zvGhfW+4d7h/S
    SQGCLYBGmsMnFGhlafY0i0Dr0QtUR5MYboagZBXM7kybAx9uVhqDWWxXJhgcFVBW
    1uDlxI72Ouq3ECc8ZOmpCAnR23QHPztj4PE=
    =skO6
    -----END PGP MESSAGE-----

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
    enabled: 1
    debug: 0
    location: Webtropia, Duesseldorf
    mac: 00:1c:42:00:04:93
    ipv4:
      public: 89.163.209.240
      freifunk: 10.185.0.2
      icvpn: 10.207.0.29
    ipv6:
      public: 2001:4ba0:babe:493::fffd
      freifunk: fd00:65a8:93a4::2
      icvpn: fec0::a:cf:0:1d

# gw03 is permanently disabled
#
#  gw03:
#    id: 3
#    enabled: 0
#    debug: 0
#    location: Netcup, Frankfurt
#    mac: 26:13:9d:ea:e1:1b
#    ipv4:
#      public: 5.45.97.58 
#      freifunk: 10.185.0.3
#      icvpn: 10.207.0.42
#    ipv6:
#      public: 2a03:4000:5:144::fffd
#      freifunk: fd00:65a8:93a4:0::3
#      icvpn: fec0::a:cf:0:2a

  gw04:
    id: 4
    enabled: 1
    debug: 0
    location: Hetzner, Nuernberg
    mac: 26:13:9d:da:31:8a
    ipv4:
      public: 138.201.16.57
      freifunk: 10.185.0.4
      icvpn: 10.207.0.42
    ipv6:
      public: 2a01:4f8:171:2729::fffd
      freifunk: fd00:65a8:93a4:0::4
      icvpn: fec0::a:cf:0:2a

  srv1:
    debug: 0
    location: Hetzner, Nuernberg
    mac: 26:13:9d:eb:61:8d
    ipv4:
      public: 138.201.16.58
      freifunk: 10.185.0.15
    ipv6:
      public: 2a01:4f8:171:2729::fdfd
      freifunk: fd00:65a8:93a4:0::15
