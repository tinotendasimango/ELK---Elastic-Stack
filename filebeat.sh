#!/usr/bin/bash
#Install and Confi gure Filebeat

#1. Install Filebeat.
sudo apt install filebeat -y

#2. Edit the Filebeat configuration file.
cd /etc/filebeat
#Comment out the following lines:
#output.elasticsearch:
#Array of hosts to connect to.
#hosts: ["localhost:9200"]
#Uncomment these lines in Logstash output section:
#output.logstash:
#hosts: ["localhost:5044"]

sed -i -e s'/#output.elasticsearch:/output.elasticsearch:/g' filebeat.yml
sed -i -e s'/#Array of hosts to connect to.:/Array of hosts to connect to.:/g' filebeat.yml
sed -i -e s'/#hosts: ["localhost:9200"]:/#hosts: ["localhost:9200"]/g' filebeat.yml
sed -i -e s'/#output.logstash:/output.logstash:/g' filebeat.yml
sed -i -e s'/#hosts: ["localhost:5044"]/hosts: ["localhost:5044"]/g' filebeat.yml

#3. Save and exit the file.

#4. Enable the Filebeat system module.
sudo filebeat modules enable system

#5. Load the index template.
sudo filebeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["localhost:9200"]'

#6. Start the Filebeat service.
sudo systemctl start filebeat

#7. Enable Filebeat service to start at system startup.
sudo systemctl enable filebeat

#8. Verify that Filebeat is shipping log fi les to Logstash forprocessing.
curl -XGET http://localhost:9200/_cat/indice