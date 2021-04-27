# fxserver

FXServer for FiveM or RedM server

## Changes

* Since 3874n WORKDIR change from `/srv` to `/opt/cfx-server`

## Docker run sample

`docker run -it -v /yourLocalServerFolder/server.cfg:/opt/cfx-server/server.cfg -v /yourLocalServerFolder/resources:/opt/cfx-server/resources routmoute/fxserver +exec server.cfg +set gamename rdr3`

## Docker compose sample

```yaml
version: "3.8"

services:
  redm:
    image: routmoute/fxserver
    tty: true
    stdin_open: true
    volumes:
      - ./server.cfg:/opt/cfx-server/server.cfg
      - ./resources:/opt/cfx-server/resources
    ports:
      - "30120:30120/tcp"
      - "30120:30120/udp"
    command: +exec server.cfg +set gamename rdr3
```

## Image based sample

```dockerfile
FROM routmoute/fxserver:latest

COPY server.cfg server.cfg
COPY resources resources

CMD ["+exec", "server.cfg", "+set", "gamename", "rdr3"]
```
