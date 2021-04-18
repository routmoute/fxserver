FROM alpine:latest

RUN apk update --no-cache
RUN apk add --no-cache libstdc++ ca-certificates curl

WORKDIR /srv

RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3833-4f97daa19198a92f95a39004769f0b8c49b22a14/fx.tar.xz | tar xJ -C .

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "run.sh"]
