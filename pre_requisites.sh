#!/usr/bin/bash

#Install Java and Nginx

#1. Update system packages.
sudo apt update

#2. Install required packages.
sudo apt install wget curl gnupg2 -y

#3. To run Elasticsearch, you require Java. Install Java.
sudo apt install openjdk-11-jdk -y

#4. Kibana dashboard uses Nginx as a reverse proxy. InstallNginx webserver.
sudo apt install nginx -y

#5. Verify the installation.
java -version