root.password:
  user:
    - present
    - name: root
    - password: "{{ pillar['root']['password'] }}"

root.screenrc:
  file:
    - managed
    - name: /root/.screenrc
    - source: salt://common/root.screenrc

root.bashrc:
  file:
    - managed
    - name: /root/.bashrc
    - source: salt://common/root.bashrc

root.vimrc:
  file:
    - managed
    - name: /root/.vimrc
    - source: salt://common/root.vimrc

root.htoprc:
  file:
    - managed
    - name: /root/.config/htop/htoprc
    - source: salt://common/root.htoprc
    - makedirs: True
