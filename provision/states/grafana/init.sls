# -*- mode: yaml -*-
# vi: ft=yaml:sw=2:ts=2:expandtab
---
include:
  - nginx

grafana_source:
  archive.extracted:
    - name: /usr/share/nginx/html/
    - source: http://grafanarel.s3.amazonaws.com/grafana-1.7.0.tar.gz
    - source_hash: sha1=c6a38d47502dacc42458844e14736aeb093c8d59
    - archive_format: tar
    - tar_options: z
    - if_missing: /usr/share/nginx/html/grafana-1.7.0
    - require:
      - pkg: nginx

grafana_install:
  file.rename:
    - name: /usr/share/nginx/html/grfn
    - source: /usr/share/nginx/html/grafana-1.7.0
    - force: yes
    - watch:
      - archive: grafana_source

grafana_config:
  file.managed:
    - name: /usr/share/nginx/html/grfn/config.js
    - source: salt://grafana/files/config.js
    - require:
      - file: grafana_install
