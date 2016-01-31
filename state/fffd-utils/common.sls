# Get the fffd-utils repo
# (contains various scripts and cronjobs)
#
fffd-utils.repo:
  git.latest:
    - name: https://github.com/freifunk-fulda/fffd-utils.git
    - target: /opt/fffd-utils

