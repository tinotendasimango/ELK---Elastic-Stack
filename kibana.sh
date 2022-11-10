#!/usr/bin/bash

#1. Install Kibana.
sudo apt install kibana -y

#2. Edit the Kibana configuration file.
cd /etc/kibana

#3. Uncomment and modify the following lines from:
#server.port: 5601
#server.host: "localhost"
#elasticsearch.hosts: ["http://localhost:9200
#To:
#server.port: 5601
#server.host: "0.0.0.0"
#elasticsearch.hosts: ["http://localhost:9200"

sed -i -e 's/#server.port: 5601/server.port: 5601/g' kibana.yml
sed -i -e 's/#server.host: "localhost"/server.host: "localhost"/g' kibana.yml
sed -i -e 's/#elasticsearch.hosts:*/elasticsearch.hosts:*/g' kibana.yml

#4. Save and close the file.

#5. Start the Kibana service.
sudo systemctl start kibana

#6. Enable Kibana service to start at system startup.
sudo systemctl enable kibana

#7. Allow traffic on port 5601
sudo ufw allow 5601/tcp

#Access Kibana Web Interface
#Open your web browser and access the Kibana web interfaceusing the URL http://YourServerIP:5601
#For example: http://192.0.2.10:5601