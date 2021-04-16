FROM alpine:latest

RUN apk update --no-cache
RUN apk add --no-cache libstdc++ ca-certificates curl

WORKDIR /srv

RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3825-e270e4db81dffbb3ba4e52370b81cdf57c01d8e0/fx.tar.xz | tar xJ -C .

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "run.sh"]
