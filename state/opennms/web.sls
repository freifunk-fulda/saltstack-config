# Firewall configuration
#

# Allow access to the WebUI
ferm.opennms.web:
  file.managed:
    - name: /etc/ferm.d/20-opennms-web.conf
    - source: salt://opennms/ferm.web.conf
    - makedirs: True
