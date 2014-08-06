# -*- mode: yaml -*-
# vi: set ft=yaml :
---
oracle-jdk-repo:
  pkgrepo.managed:
    - ppa: webupd8team/java

oracle-license:
  debconf.set:
    - name: oracle-java7-installer
    - data: {'shared/accepted-oracle-license-v1-1': {'type': 'select', 'value': 'true'}}

oracle-jdk7:
  pkg.installed:
    - name: oracle-java7-installer
    - require:
      - pkgrepo: oracle-jdk-repo
      - debconf: oracle-license

jdk7-set-default:
  pkg.installed:
    - name: oracle-java7-set-default
    - require:
      - pkg: oracle-java7-installer
