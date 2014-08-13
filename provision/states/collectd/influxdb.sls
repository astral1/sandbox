# -*- mode: yaml -*-
# vi: ft=yaml:sw=2:ts=2:expandtab
---
collectd_influxdb_binary:
  archive.extracted:
    - name: /opt/
    - source: salt://collectd/influxdb/influxdb-collectd-proxy_linux_amd64.tar.gz
    - source_hash: sha1=31347da6fbb158dd51466d949e5dfbc268835887
    - archive_format: tar
    - tar_options: z
    - if_missing: /opt/influxdb-collectd-proxy_linux_amd64/

enable_network_plugin:
  file.uncomment:
    - name: /etc/collectd/collectd.conf
    - regex: LoadPlugin network

config_proxy:
  file.append:
    - name: /etc/collectd/collectd.conf
    - source: salt://collectd/influxdb/network-plugin
    - source_hash: sha1=8fb5ab4eaa369814a545820031a27bca3d7225ab
    - require:
      - file: enable_network_plugin
