ssh:
  pkg.installed:
    - name: openssh
  file.managed:
    - name: /etc/ssh/ssh_config
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://ssh/client/files/ssh_config
    - require:
      - pkg: ssh
