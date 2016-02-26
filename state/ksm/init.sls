# Install and start sysfsutils
#
sysfsutils:
  pkg.installed:
    - name: sysfsutils

  service.running:
    - name: sysfsutils
    - enable: True
    - watch:
      - file: /etc/sysfs.conf
      - file: /etc/sysctl.d/*
