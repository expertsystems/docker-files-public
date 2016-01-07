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

exec "$@"