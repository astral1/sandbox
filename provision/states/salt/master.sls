# -*- mode: yaml -*-
# vi: set ft=yaml :
---
include:
  - salt.repo

salt-master:
  pkg.installed:
    - require:
      - pkgrepo: salt-repo
    - refresh: True
  service.running:
    - require:
      - pkg: salt-master
      - file: /etc/salt/master
    - watch:
      - file: /etc/salt/master
#      - file: /etc/salt/master.d/*

/etc/salt/master:
  file.managed:
    - source: salt://salt/config/master

/srv/salt/salt:
  file.recurse:
    - source: salt://salt
