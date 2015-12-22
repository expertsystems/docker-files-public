# Resin docker image
[CentOS](https://hub.docker.com/_/centos/) based base image with [Resin](http://caucho.com/products/resin) running on Oracle JDK 8.

Also adds [MySQL Connector/J](http://dev.mysql.com/downloads/connector/j/) 5.1.38 to `/var/resin/webapp-jars`. If you need this, make sure to include
```xml
 <class-loader>
  ...
  <tree-loader path="${resin.root}/webapp-jars"/>
 </class-loader> 
```
in your Resin config.

### Directories
## `RESIN_HOME`
`RESIN_HOME` points to `/usr/local/share/resin-4.0.40`

### Logs
Logs are written to `/var/log/resin/`.