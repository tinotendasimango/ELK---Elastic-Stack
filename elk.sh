#!/usr/bin/bash

./pre_requisites.sh

./elasticsearch.sh

./logstash.sh

./kibana.sh

./filebeat.sh

echo'==========> Successfully installed Elastic stack <=========='