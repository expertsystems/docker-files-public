#!/bin/sh
set -e

# if command starts with an option, prepend filebeat (executable)
if [ "${1:0:1}" = '-' ]; then
	set -- filebeat "$@"
fi

# Set Logstash host if needed
LOGSTASH_HOST_COUNT=`grep LOGSTASH_HOST /etc/filebeat/filebeat.yml | wc -l`
if [ $LOGSTASH_HOST_COUNT -gt 0 ]; then
  if [ -z "$LOGSTASH_HOST" ]; then
    echo "LOGSTASH_HOST environment variable must be supplied" 1>&2;
    exit -1
  else
    sed --in-place "s/LOGSTASH_HOST/$LOGSTASH_HOST/" /etc/filebeat/filebeat.yml
  fi
fi

# Optionally enable TLS/SSL
if [ "$TLS" == "true" ]; then
  echo "Enabling TLS/SSL"
  sed --in-place "s/# tls:/tls:/" /etc/filebeat/filebeat.yml
  
  if [ "$INSECURE" == "true" ]; then
    echo "Allowing insecure TLS/SSL"
    sed --in-place "s/#  insecure: true/  insecure: true/" /etc/filebeat/filebeat.yml
  fi
fi

exec "$@"