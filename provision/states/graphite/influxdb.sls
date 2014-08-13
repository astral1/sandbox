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

pip_requirements:
  pip.installed:
    - requirements: salt://graphite/influxdb/requirements

patch:
  file.patch:
    - name: /usr/local/lib/python2.7/dist-packages/graphite_influxdb.py
    - source: salt://graphite/influxdb/patch
    - hash: sha1=5b8320e93dd0a2831b2b3a6c5d83f8199586d3e5
    - require:
      - pip: graphite_influxdb

append_config:
  file.append:
    - name: /opt/graphite-web/webapp/graphite/local_settings.py
    - source: salt://graphite/influxdb/local_setting
    - source_hash: sha1=a7ed90e7487679d747b7f9e5619ad3900a448fdc
    - require:
      - file: create_config
