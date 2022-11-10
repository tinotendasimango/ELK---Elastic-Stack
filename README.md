It's comprised of Elasticsearch, Kibana, Beats, and Logstash which is also known as the ELK Stack and more.
The purpose is to reliably and securely take data from any source, in any format, then search, analyze, and visualize.
A powerful logging tool for DevOps.

Elasticsearch: This is the main component of the stack. It is a distributed RESTful search engine that stores and searches the text-based collected data.

Logstash: This data processing component collects and parses the incoming data before sending it to Elasticsearch for storage.

Kibana: This is the web interface dashboard used for searching and exploring the analyzed log data.

Beats: This is a lightweight transport agent with pluginsused to aggregate application data from different servers and applications and then send the data to either Logstash or Elasticsearch for processing.