include:
  - pam

sshd:
  pkg.installed:
    - name: openssh
  group.present:
    - name: ssh
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - names:
      - /etc/ssh/sshd_config:
        - source: salt://ssh/server/files/sshd_config
      - /etc/motd:
        - source: salt://ssh/server/files/motd
        - template: jinja
    - require:
      - pkg: sshd
  service.running:
    - enable: True
    - require:
      - group: sshd
      - pkg: pam
      - pkg: sshd
      - file: /etc/motd
    - watch:
      - file: /etc/ssh/sshd_config
