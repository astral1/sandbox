# -*- mode: yaml -*-
# vi: set ft=yaml :
---
include:
  - java

go.cd:
  pkg.installed:
    - sources:
      - gocd-server: http://download.go.cd/gocd-deb/go-server-14.2.0-377.deb
    - hash: sha1=5f66e4effde11695f606270ea0eb27eb36226033
    - require:
      - pkg: oracle-jdk7
