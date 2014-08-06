# -*- mode: yaml -*-
# vi: set ft=yaml :
---
include:
  - salt.repo

salt-minion:
  pkg.installed:
    - require:
      - pkgrepo: salt-repo
    - refresh: True
  service.running:
    - require:
      - pkg: salt-minion
      - file: /etc/salt/minion
    - watch:
      - file: /etc/salt/minion
#      - file: /etc/salt/minion.d/*

/etc/salt/minion:
  file.managed:
    - source: salt://salt/config/minion
