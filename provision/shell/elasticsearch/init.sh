# require: java

curl -L -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.tar.gz
tar zxvf elasticsearch-1.3.1.tar.gz
cd elasticsearch-1.3.1
bin/plugin -i lmenezes/elasticsearch-kopf
bin/elasticsearch -d
