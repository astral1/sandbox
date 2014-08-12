# -*- mode: yaml -*-
# vi: ft=yaml:sw=2:ts=2:expandtab
---
influxdb:
  pkg.installed:
    - sources:
      - influxdb: http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
  service.running:
    - require:
      - pkg: influxdb
