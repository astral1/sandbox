# -*- mode: yaml -*-
# vi: set ft=yaml :
---
docker-repo:
  pkgrepo.managed:
    - name: deb https://get.docker.io/ubuntu docker main
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 36A1D7869245C8950F966E92D8576A8BA88D21E9
    - keyserver: keyserver.ubuntu.com

lxc-docker:
  pkg:
    - installed

vagrant:
  user.present:
    - groups:
      - docker