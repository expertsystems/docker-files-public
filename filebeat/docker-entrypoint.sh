#!/bin/sh
set -e

# Set Logstash host
sed --in-place "s/LOGSTASH_HOST/$1/" /etc/filebeat/filebeat.yml

exec /bin/filebeat -e -c /etc/filebeat/filebeat.yml