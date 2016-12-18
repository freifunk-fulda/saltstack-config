# Install and enable salt-minion
#
salt:
  pkg.latest:
    - name: salt-minion

  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: /etc/salt/*
