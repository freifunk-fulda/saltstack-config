# This state will build B.A.T.M.A.N from source
# and install it to /usr/local

# Install batman_adv and batctl build dependencies
#
batman_adv_dep:
  pkg.latest:
    - pkgs:
      - build-essential
      - pkg-config
      - checkinstall
      - libnl-3-dev

batman_adv_dep_backports:
  pkg.latest:
    - pkgs: 
      - linux-image-amd64
      - linux-headers-amd64
    - fromrepo: jessie-backports
    - require:
      - pkgrepo: apt.backports


# Build batman_adv and batctl from source
#
build_batman_adv:
  cmd.script:
    - source: salt://batman/files/build-batman_adv.sh
    - require:
      - pkg: batman_adv_dep
      - pkg: batman_adv_dep_backports

build_batctl:
  cmd.script:
    - source: salt://batman/files/build-batctl.sh
    - require:
      - pkg: batman_adv_dep


# Install batman cli
#
batctl:
  pkg.latest:
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
#
batman@.service:
  file.managed:
    - name: /etc/systemd/system/batman@.service
    - user: root
    - group: root
    - mode: 644
    - source: salt://batman/files/batman@.service
    - makedirs: True

