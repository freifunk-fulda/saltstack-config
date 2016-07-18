# Install and enable salt-minion
#
salt:
  pkgrepo.managed:
    - name: deb http://debian.saltstack.com/debian jessie-saltstack main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub

  pkg.latest:
    - name: salt-minion

  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: /etc/salt/*


# configure carbon backend.
# The saltstack scheduler will execute scripts in
# /etc/munin/plugins and return the results into carbon.
#
salt.carbon.conf:
  file.managed:
    - name: /etc/salt/minion.d/carbon.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://salt/files/carbon.conf
    - require:
      - pkg: salt-minion
      - pkg: munin-node
