#!/usr/bin/bash
#Install and Configure Elasticsearch

#1.Install required packages 

sudo apt install apt-transport-https -y

#2. Import the Elasticsearch PGP signing key.
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

#3. Add Elasticsearch APT repository.
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee â€“a /etc/apt/sources.list.d/elastic-7.x.list

#4. Update the system.
sudo apt update

#5. Install Elasticsearch.
sudo apt install elasticsearch -y

#6. Edit Elasticsearch configuration file.
$ cd /etc/elasticsearch

#7. Uncomment the following lines.
#network.host: 192.168.0.1
#http.port: 9200
#Change value of network.host to localhost and add the following line in the Discovery section.
#discovery.type: single-node
#The final file should have the lines as follows:
#network.host: localhost
#http.port: 9200
#discovery.type: single-node

sed -i -e 's/#network.host: 192.168.0.1/network.host: 192.168.0.1/g' elasticsearch.y
sed -i -e 's/#http.port: 9200/http.port: 9200/g' elasticsearch.y

#8. Save and close the file.

#9. Reload the daemon.
sudo systemctl daemon-reload

#10. Start the Elasticsearch service.
sudo systemctl start elasticsearch

#11. Enable Elasticsearch service to start at system startup.
sudo systemctl enable elasticsearch

#12. Verify that Elasticsearch is running and listening on port 9200.
curl -X GET "localhost:9200"