FROM alpine:latest

RUN apk update --no-cache
RUN apk add --no-cache libstdc++ ca-certificates curl

WORKDIR /srv

RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3679-b45702ad5c4f7da870c55bdd10900ba64f53a097/fx.tar.xz | tar xJ -C .

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "run.sh"]
