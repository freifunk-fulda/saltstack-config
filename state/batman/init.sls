# Install batman cli
#
batman:
  pkg.installed:
    - name: batctl

  service.running:
    - name: batman@fffd
    - enable: True
    - requires:
      - pkg: batctl
    - watch:
      - file: /etc/network/interfaces.d/fffd.bat



# Load batman kernel module automatically
#
batman_adv:
  kmod.present:
    - persist: True


# Add systemd service
batman@.service:
  file.managed:
    - name: /etc/systemd/system/batman@.service
    - user: root
    - group: root
    - mode: 644
    - source: salt://batman/batman@.service
    - makedirs: True

