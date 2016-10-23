apt-transport-https:
  pkg.latest

nodejs:
  pkgrepo.managed:
    - humanname: nodejs
    - name: deb https://deb.nodesource.com/node_6.x jessie main
    - key_url: salt://hopglass/files/nodejs.gpg
    - require_in:
      - pkg: nodejs
    - require:
      - pkg: apt-transport-https
  pkg.latest:
    - pkgs:
      - nodejs


hopglass:
  user.present
