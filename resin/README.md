# Resin Docker image `Dockerfile`
[CentOS](https://hub.docker.com/_/centos/) based base image with [Resin](http://caucho.com/products/resin) running on Oracle JDK 8.

Also adds [MySQL Connector/J](http://dev.mysql.com/downloads/connector/j/) 5.1.38 to `/var/resin/webapp-jars`. If you need want to make use of this, make sure to include
```xml
 <class-loader>
  ...
  <tree-loader path="${resin.root}/webapp-jars"/>
 </class-loader> 
```
in your Resin config.

The `ENTRYPOINT` is `resinctl` and the default parameters are `console`. This means you can modify the behaviour, such as the paths, by providing other
parameters to the entrypoint, for example using `CMD`. 

## Paths
### Configuration
The configuration file is expected to be found in `/etc/resin/resin.xml`

### Webapps
WAR files go in the `/var/resin/webapps` directory.

### `RESIN_HOME`
`RESIN_HOME` points to `/usr/local/share/resin-4.0.40`

### Logs
Logs are written to `/var/log/resin/`. You may want to map this as a volume. (Tip: See [expertsystems/filebeat](https://hub.docker.com/r/expertsystems/filebeat/))

### Session data
Session data is written to `/var/resin/resin-data`, so if you want to preserve session data between images, consider mapping this as a volume.