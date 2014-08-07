# require: java

curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz
tar zxvf logstash-1.4.2.tar.gz
cd logstash-1.4.2
cat <<EOF > logstash.conf
input {
  file {
    path => "/var/log/syslog"
    start_position => beginning
  }
}

output {
  elasticsearch { host => localhost }
}
EOF

wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz
