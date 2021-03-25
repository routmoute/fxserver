FROM alpine:latest

RUN apk update --no-cache
RUN apk add --no-cache libstdc++ ca-certificates curl

WORKDIR /srv

RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3731-004d577bad5cb03b8bac87c65d42defa833f52f9/fx.tar.xz | tar xJ -C .

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "run.sh"]
