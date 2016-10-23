
/home/hopglass/hopglass-server.git:
  git.latest:
    - name: https://github.com/hopglass/hopglass-server.git
    - rev: v0.1.1
    - target: /home/hopglass/hopglass-server.git
    - user: hopglass
    - require:
      - pkg: git
      - pkg: nodejs
      - user: hopglass


hopglass_server_install:
  cmd.run:
    - onchanges:
       - git: /home/hopglass/hopglass-server.git
       - pkg: nodejs
    - require:
       - git: /home/hopglass/hopglass-server.git
    - cwd: /home/hopglass/hopglass-server.git
    - name: npm install


hopglass_service_file:
  file.copy:
    - name: /etc/systemd/system/hopglass-server@.service
    - source: /home/hopglass/hopglass-server.git/hopglass-server@.service
    - require:
       - git: /home/hopglass/hopglass-server.git
    - watch:
       - git: /home/hopglass/hopglass-server.git


patch_hopglass_service_file:
  file.replace:
    - name: /etc/systemd/system/hopglass-server@.service
    - pattern: /opt/hopglass/server
    - repl: /home/hopglass/hopglass-server.git
    - watch:
        - file: hopglass_service_file

/etc/hopglass-server/default/config.json:
   file.managed:
    - makedirs: True
    - user: hopglass
    - group: hopglass
    - source: salt://hopglass/files/config.json.j2
    - template: jinja
    - require:
       - user: hopglass
       - git: /home/hopglass/hopglass-server.git

/etc/hopglass-server/default/aliases.json:
   file.managed:
    - makedirs: True
    - user: hopglass
    - group: hopglass
    - source: salt://hopglass/files/aliases.json.j2
    - template: jinja
    - require:
       - user: hopglass
       - git: /home/hopglass/hopglass-server.git

hopglass-server@default.service:
  service.running:
    - reload: False
    - enable: True
    - watch:
       - git: /home/hopglass/hopglass-server.git
       - file: patch_hopglass_service_file
       - file: /etc/hopglass-server/default/config.json
    - require:
       - cmd: hopglass_server_install
       - file: patch_hopglass_service_file

/etc/ferm.d/40-hopglass.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://hopglass/files/ferm.conf.j2
    - template: jinja
    - require:
      - service: hopglass-server@default.service
      - pkg: ferm
