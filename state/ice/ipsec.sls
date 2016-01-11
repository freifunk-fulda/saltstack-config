# install strongswan and configure ipsec
#
# NOTE: The local ipsec keypair needs to be added manually at the moment.
#       Find the private key in the fffd-pass repo.
#
#       Use commands like the following for the initial setup of keys:
#       ipsec pki --gen --type rsa --outform pem --size 4096 > /etc/ipsec.d/private/gw02.pem
#       ipsec pki --pub --in /etc/ipsec.d/private/gw02.pem --outform pem > /etc/ipsec.d/public/gw02.pub
#       echo ": RSA gw02.pem" >> /etc/ipsec.secrets

strongswan:
  pkg.installed:
    - name: strongswan

  service.running:
    - name: strongswan
    - enable: True
    - reload: True
    - require:
      - pkg: strongswan
    - watch:
      - file: /etc/ipsec.conf


ipsec.conf:
  file.managed:
    - name: /etc/ipsec.conf
    - source: salt://ice/ipsec/ipsec.conf.tpl
    - template: jinja
    - makedirs: True


{% for peer in pillar.peerings[grains['id']]['peers'].keys() -%}
peer.{{peer}}.pub:
  file.managed:
    - name: /etc/ipsec.d/public/{{ peer }}.pub
    - source: salt://ice/ipsec/peer.pub.tpl
    - template: jinja
    - makedirs: True
    - context:
        peer: {{ peer }}
{% endfor -%}



ipsec.ferm:
  file:
    - managed
    - name: /etc/ferm.d/30-ipsec.conf
    - source: salt://ice/ipsec/ferm.conf.tpl
    - makedirs: True
    - template: jinja
    - require:
      - pkg: strongswan

