# -*- mode: yaml -*-
# vi: set ft=yaml :
---
get-source:
  archive.extracted:
    - name: /usr/local/
    - source: http://golang.org/dl/go1.3.src.tar.gz
    - source_hash: sha1=9f9dfcbcb4fa126b2b66c0830dc733215f2f056e
    - archive_format: tar
    - tar_options: z
    - if_missing: /usr/local/go

compile:
  cmd.run:
    - name: ./all.bash
    - cwd: /usr/local/go/src
    - unless: test -d /usr/local/go/bin
    - require:
      - archive: get-source

set-env:
  file.append:
    - name: /etc/profile
    - text: export PATH=/usr/local/go/bin:$PATH
    - require:
      - cmd: compile
