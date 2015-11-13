# Install and enable openvpn
#
openvpn:
  pkg.installed:
    - name: openvpn

  service.running:
    - name: openvpn@openvpn
    - enable: True
    - require:
      - pkg: openvpn
    - watch:
      - file: /etc/openvpn/*


# perfectprivacy: add ca and auth files
#
/etc/openvpn/ca.crt:
  file.managed:
    - name: /etc/openvpn/perfectprivacy/ca.crt
    - user: root
    - group: root
    - mode: 644
    - source: salt://openvpn/ca.crt
    - makedirs: True
    - require:
      - pkg: openvpn


/etc/openvpn/perfectprivacy/auth.txt:
  file.managed:
    - name: /etc/openvpn/perfectprivacy/auth.txt
    - user: root
    - group: root
    - mode: 640
    - source: salt://openvpn/auth.txt.tpl
    - template: jinja
    - makedirs: True
    - require:
      - pkg: openvpn



# perfectprivacy: add config and key material for some remote endpoints
#
{% for connection in pillar['openvpn']['perfectprivacy']['connections'].keys() %}

/etc/openvpn/pp-{{connection}}.conf:
  file.managed:
    - name: /etc/openvpn/pp-{{connection}}.conf
    - user: root
    - group: root
    - mode: 640
    - source: salt://openvpn/perfectprivacy.conf.tpl
    - template: jinja
    - makedirs: True
    - require:
      - pkg: openvpn
    - context:
        connection: {{connection}}

/etc/openvpn/perfectprivacy/{{connection}}.crt:
  file.managed:
    - name: /etc/openvpn/perfectprivacy/{{connection}}.crt
    - user: root
    - group: root
    - mode: 640
    - source: salt://openvpn/connection.crt.tpl
    - template: jinja
    - makedirs: True
    - require:
      - pkg: openvpn
    - context:
        connection: {{connection}}

/etc/openvpn/perfectprivacy/{{connection}}.key:
  file.managed:
    - name: /etc/openvpn/perfectprivacy/{{connection}}.key
    - user: root
    - group: root
    - mode: 640
    - source: salt://openvpn/connection.key.tpl
    - template: jinja
    - makedirs: True
    - require:
      - pkg: openvpn
    - context:
        connection: {{connection}}

/etc/openvpn/perfectprivacy/{{connection}}.ta:
  file.managed:
    - name: /etc/openvpn/perfectprivacy/{{connection}}.ta
    - user: root
    - group: root
    - mode: 640
    - source: salt://openvpn/connection.ta.tpl
    - template: jinja
    - makedirs: True
    - require:
      - pkg: openvpn
    - context:
        connection: {{connection}}

{% endfor %}


# initially enable uplink and set gw mode
#
openvpn.check_gateway:
  cmd.run:
    - name: /opt/fffd-utils/check_gateway.new.sh
    - creates: /etc/openvpn/openvpn.conf
    - requires:
      - git: fffd-utils.repo
      - pkg: openvpn
      - file: /etc/openvpn/ca.crt
      - file: /etc/openvpn/perfectprivacy/auth.txt
{% for connection in pillar['openvpn']['perfectprivacy']['connections'].keys() %}
      - file: /etc/openvpn/pp-{{connection}}.conf
      - file: /etc/openvpn/perfectprivacy/{{connection}}.crt
      - file: /etc/openvpn/perfectprivacy/{{connection}}.key
      - file: /etc/openvpn/perfectprivacy/{{connection}}.ta
{% endfor %}


# Enable process monitoring with Net-SNMP
#
openvpn.snmp.proc.conf:
  file.managed:
    - name: /etc/snmp/conf.d/proc.openvpn.conf
    - source: salt://openvpn/netsnmp.proc.conf
    - makedirs: True
