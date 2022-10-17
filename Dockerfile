FROM alpine AS dwnld
RUN apk update --no-cache && apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5963-f62bb9a9cf25e22f1f6048afba91b5a067c1d686/fx.tar.xz | tar xJ -C /srv/.

FROM scratch
COPY --from=dwnld /srv/alpine/. /.
RUN mkdir /txData && chown 1000:1000 /txData
RUN addgroup -S --gid 1000 cfx && adduser -S --uid 1000 cfx -G cfx
USER cfx
WORKDIR /opt/cfx-server
EXPOSE 30120/tcp 30120/udp 40120/tcp
ENTRYPOINT ["/opt/cfx-server/FXServer"]
