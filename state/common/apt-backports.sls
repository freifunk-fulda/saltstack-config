# Add the backports package repo
#
backports:
  pkgrepo.managed:
    - humanname: Backports
    - name: deb http://http.debian.net/debian jessie-backports main
    - dist: jessie-backports
    - file: /etc/apt/sources.list.d/backports.list

