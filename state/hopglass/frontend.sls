/home/hopglass/hopglass-frontend.git:
  git.latest:
    - name: https://github.com/Moorviper/hopglass.git
    - target: /home/hopglass/hopglass-frontend.git
    - ref: v0.1
    - branch: fffd
    - user: hopglass
    - force_fetch: True
    - force_reset: True
    - require:
      - pkg: git
      - pkg: nodejs
      - user: hopglass


hopglass_frontend_remove_build:
  cmd.run:
    - onchanges:
      - git: /home/hopglass/hopglass-frontend.git
      - pkg: nodejs
    - watch:
      - git: /home/hopglass/hopglass-frontend.git
      - pkg: nodejs
    - cwd: /home/hopglass/hopglass-frontend.git
    - name: rm -rf build

hopglass_frontend_npm_install:
  cmd.run:
    - onchanges:
      - cmd: hopglass_frontend_remove_build
    - require:
      - cmd: hopglass_frontend_remove_build
    - cwd: /home/hopglass/hopglass-frontend.git
    - user: hopglass
    - name: npm install && npm install grunt-cli

hopglass_frontend_grunt:
  cmd.run:
    - onchanges:
      - cmd: hopglass_frontend_npm_install

    - require:
       - cmd: hopglass_frontend_npm_install
       - git: /home/hopglass/hopglass-frontend.git

    - cwd: /home/hopglass/hopglass-frontend.git
    - user: hopglass
    - name: ./node_modules/.bin/grunt

hopglass_frontend_empty_var_www:
  file.absent:
    - name: /var/www/map.fulda.freifunk.net/
    - require:
       - file: /var/www/map.fulda.freifunk.net
       - cmd: hopglass_frontend_grunt
    - watch:
       - cmd: hopglass_frontend_grunt

hopglass_frontend_create_var_www:
  file.directory:
    - user: www-data
    - group: www-data
    - name: /var/www/map.fulda.freifunk.net
    - require:
       - file: hopglass_frontend_empty_var_www
    - watch:
       - file: hopglass_frontend_empty_var_www

hopglass_frontend_copy_to_var_www:
  cmd.run:
    - name: cp -ar /home/hopglass/hopglass-frontend.git/build/* /var/www/map.fulda.freifunk.net/. && chown www-data:www-data -R /var/www/map.fulda.freifunk.net/
    - require:
       - file: hopglass_frontend_create_var_www
    - onchanges:
       - file: hopglass_frontend_create_var_www

hopglass_frontend_install_config:
  file.managed:
    - name: /var/www/map.fulda.freifunk.net/config.json
    - user: www-data
    - group: www-data
    - source: salt://hopglass/files/frontend_config.json.j2
    - template: jinja
    - require:
      - cmd: hopglass_frontend_copy_to_var_www
    - watch:
      - cmd: hopglass_frontend_copy_to_var_www
