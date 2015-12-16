# Install a munin node on the gateways and configure some plugins
#
munin-node-gateway:
  pkg.installed:
    - pkgs: 
      - munin-node
      - libnet-netmask-perl


# Deploy plugins
#
munin-node-gateway.plugins:
  file.recurse:
    - name: /etc/munin/plugins
    - source: salt://munin/plugins
    - clean: True
    - dir_mode: 755
    - file_mode: 755

# Deploy plugin config
#
munin-node-gateway.plugin-conf:
  file.recurse:
    - name: /etc/munin/plugin-conf.d
    - source: salt://munin/plugin-conf.d
    - clean: True
    - dir_mode: 755
    - file_mode: 755

#munin.conf:
#   file.managed:
#    - name: /etc/munin/munin-conf.d/munin.conf
#    - user: root
#    - group: munin
#    - mode: 640
#    - source: salt://munin/master/munin.conf
#    - require:
#      - pkg: munin-node

