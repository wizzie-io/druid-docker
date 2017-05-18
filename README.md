# Druid Docker

The druid docker by default use derby metadata-storage and local deep storage. You can change it, to do it you could mount a volume with the new configuration into the folder `/opt/druid/conf`.

## Enviroments

* **ZOOKEEPER_SERVER**
The zookeeper server address.

* **DRUID_HOST**
The advertiser address that uses druid to expose the service on zookeeper.

* **DRUID_JVM_ARGS**
The JVM arguments to execute the druid services.

## Example

```
docker run -it -e ZOOKEEPER_SERVER=192.168.0.102 -e DRUID_HOST=192.168.0.102 druid-coordinator:latest
```
