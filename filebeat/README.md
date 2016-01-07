# Filebeat Docker image

This is a Docker image containing [Filebeat](https://www.elastic.co/products/beats/filebeat). By default it will read your
logs and forward them to [Logstash](https://www.elastic.co/products/logstash).
 
The recommended usage is to make a container from this image the [data volume](https://docs.docker.com/engine/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container)
for your logs.

## Parameters
You can pass command line parameters to Filebeat while launching this image, such as 
```
docker run --rm -it expertsystems/filebeat --help
```

Unless you override the configuration file via image or parameters, when launching a container from this image you need 
to supply the hostname and port where your Logstash is listening as the `LOGSTASH_HOST` environment variable.
Example:
```
docker run -d --name my-logs -e LOGSTASH_HOST=my-logstash.mycompany.com:5044 expertsystems/filebeat
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