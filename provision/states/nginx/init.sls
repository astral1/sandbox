# -*- mode: yaml -*-
# vi: ft=yaml:sw=2:ts=2:expandtab
---
nginx:
  pkg:
    - installed
  service.running:
    - require:
      - pkg: nginx
