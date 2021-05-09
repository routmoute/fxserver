FROM alpine AS dwnld
RUN apk update --no-cache && apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3922-d59ca5ee4232a9d636fd71e116f61960e974b29e/fx.tar.xz | tar xJ -C /srv/.

FROM alpine
RUN apk update --no-cache && apk add --no-cache libstdc++
COPY --from=dwnld /srv/. /opt/cfx-server/.
WORKDIR /opt/cfx-server
EXPOSE 30120/tcp 30120/udp 40120/tcp
ENTRYPOINT ["sh", "run.sh"]
