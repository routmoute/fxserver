FROM alpine:latest

RUN apk update --no-cache
RUN apk add --no-cache libstdc++ ca-certificates curl

WORKDIR /srv

RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3839-25200217a35f2dba775f9eb2a0ef690ce86c239d/fx.tar.xz | tar xJ -C .

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "run.sh"]
