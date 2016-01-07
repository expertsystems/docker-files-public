# Filebeat Docker image

This is a Docker image containing [Filebeat](https://www.elastic.co/products/beats/filebeat). By default it will read your
logs and forward them to [Logstash](https://www.elastic.co/products/logstash).
 
The recommended usage is to make a container from this image the [data volume](https://docs.docker.com/engine/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container)
for your logs.

## Parameters
When launching a container from this image, you need to supply the hostname and port where your Logstash is listening.
Example:
```
docker run -d --name my-logs expertsystems/filebeat my-logstash.mycompany.com:5044
```

The corresponding Logstash configuration would be
```
input {
  beats {
    port => 5044
  }

  ...
```

## Data volume
Logs in `/var/log` and one level below (such as `/var/log/myapplication/mylog.log`) are forwarded. Furthermore `/var/log`
is declared as a volume, meaning you can use the `--volumes-from` parameter for the container whose logs you want to forward.

Continuing the example
```
docker run mycompany/myapp --volumes-from my-logs 
```

## Tags
Tags correspond to the Filebeat version.