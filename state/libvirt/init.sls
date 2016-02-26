# Install and enable libvirt
#
libvirt:
  pkg.installed:
    - name: libvirt-bin

  service.running:
    - name: libvirtd
    - enable: True
