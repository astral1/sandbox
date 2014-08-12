# -*- mode: yaml -*-
# vi: ft=yaml:sw=2:ts=2:expandtab
---
include:
  - pip
  - lib.cairo
  - python.develop

source:
  git.latest:
    - name: https://github.com/graphite-project/graphite-web.git
    - target: /opt/graphite-web

requirements:
  pip.installed:
    - requirements: /opt/graphite-web/requirements.txt
    - require:
      - sls: lib.cairo
      - sls: python.develop

create_config:
  file.copy:
    - name: /opt/graphite-web/webapp/graphite/local_settings.py
    - source: /opt/graphite-web/webapp/graphite/local_settings.py.example
    - require:
      - git: source

wsgi_server:
  pip.installed:
    - name: gunicorn
