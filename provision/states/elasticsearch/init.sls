# -*- mode: yaml -*-
# vi: set ft=yaml :
---
include:
  - java

get-source:
  archive.extracted:
    - name: /usr/local/
    - source: https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.tar.gz
    - source_hash: sha1=8f116d47d015fb0cb3617d213b5673490b052c39
    - archive_format: tar
    - tar_options: z
    - if_missing: /usr/local/elasticsearch-1.3.1

install-kopf:
  cmd.run:
    - name: /usr/local/elasticsearch-1.3.1/bin/plugin -i lmenezes/elasticsearch-kopf
    - watch:
      - archive: get-source
