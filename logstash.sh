#!/usr/bin/bash

#1. Install Logstash.
sudo apt install logstash -y

#2. Start the Logstash service.
sudo systemctl start logstash

#3. Enable Logstash service to start at system startup.
sudo systemctl enable logstash

#4. Verify Logstash service status.
sudo systemctl status logstash