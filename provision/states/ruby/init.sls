# -*- mode: yaml -*-
# vi: set ft=yaml :
---
rvm:
  group.present:
    - addusers:
      - vagrant

ruby-2.1:
  rvm.installed:
    - default: True
