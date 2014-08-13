# -*- mode: yaml -*-
# vi: ft=yaml:sw=2:ts=2:expandtab
---
include:
  - pip
  - .web

graphite_influxdb:
  pip.installed:
    - name: git+git://github.com/vimeo/graphite-influxdb
    - require:
      - sls: graphite.web 

patch:
  file.patch:
    - name: /usr/local/lib/python2.7/dist-packages/graphite_influxdb.py
    - source: salt://graphite/influxdb/patch
    - hash: sha1=1c848de7fcd438bfe981ba91a86ec2b460c24ed1
    - require:
      - pip: graphite_influxdb

append_config:
  file.append:
    - name: /opt/graphite-web/webapp/graphite/local_settings.py
    - source: salt://graphite/influxdb/local_setting
    - source_hash: sha1=a7ed90e7487679d747b7f9e5619ad3900a448fdc
    - require:
      - file: create_config
