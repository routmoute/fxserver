# fxserver

FXServer for FiveM or RedM server

## Tags

it's recommended to use `recommended` tag to use recommended FXServer version.

- [`recommended`](https://github.com/routmoute/fxserver/tree/recommended)
- [`optional`](https://github.com/routmoute/fxserver/tree/optional)
- [`latest`](https://github.com/routmoute/fxserver/tree/main)

## Examples

### Docker run sample

#### FiveM
```sh
docker run -it -p 30120:30120/tcp -p 30120:30120/udp \
    -v /yourLocalServerFolder/server.cfg:/opt/cfx-server/server.cfg \
    -v /yourLocalServerFolder/resources:/opt/cfx-server/resources \
    routmoute/fxserver:recommended +exec server.cfg
```

#### RedM
```sh
docker run -it -p 30120:30120/tcp -p 30120:30120/udp \
    -v /yourLocalServerFolder/server.cfg:/opt/cfx-server/server.cfg \
    -v /yourLocalServerFolder/resources:/opt/cfx-server/resources \
    routmoute/fxserver:recommended +exec server.cfg +set gamename rdr3
```

### Docker compose sample

#### FiveM
```yaml
services:
  fivem:
    image: routmoute/fxserver:recommended
    tty: true
    stdin_open: true
    volumes:
      - ./server.cfg:/opt/cfx-server/server.cfg
      - ./resources:/opt/cfx-server/resources
    ports:
      - "30120:30120/tcp"
      - "30120:30120/udp"
    command: +exec server.cfg
```

#### RedM
```yaml
services:
  redm:
    image: routmoute/fxserver:recommended
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

### Image based sample

#### FiveM
```dockerfile
FROM routmoute/fxserver:recommended

COPY server.cfg server.cfg
COPY resources resources

CMD ["+exec", "server.cfg"]
```

#### RedM
```dockerfile
FROM routmoute/fxserver:recommended

COPY server.cfg server.cfg
COPY resources resources

CMD ["+exec", "server.cfg", "+set", "gamename", "rdr3"]
```

### TXAdmin
To access TXAdmin Interface, you need to add `40120:40120/tcp` port.
