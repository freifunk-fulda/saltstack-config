# Allow connections to master
salt.iptables:
  file.managed:
    - name: /etc/ferm.d/50-salt-master.conf
    - source: salt://salt/master.ferm.conf
    - makedirs: True

