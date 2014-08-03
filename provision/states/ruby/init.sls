# -*- mode: yaml -*-
# vi: set ft=yaml :
---
rvm:
  group.present:
    - addusers:
      - vagrant

ruby-2.1.1:
  rvm.installed:
    - default: True

deck2:
  rvm.gemset_present:
    - ruby: ruby-2.1.1
    - require:
      - rvm: ruby-2.1.1

rvm ruby-2.1.1@deck2 do bundle install:
  cmd.run:
    - cwd: /vagrant
    - shell: /usr/local/rvm/bin/rvm-shell