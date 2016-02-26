# Install and start sysfsutils
#
sysfsutils:
  pkg.installed:
    - name: sysfsutils

  service.running:
    - name: sysfsutils
    - enable: True
    - watch:
      - file: /etc/sysctl.d/*
