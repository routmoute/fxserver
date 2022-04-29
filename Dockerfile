FROM alpine AS dwnld
RUN apk update --no-cache && apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5538-0d6b8f96a3ab19d1b026f87be438bf1a7e79302a/fx.tar.xz | tar xJ -C /srv/.

FROM scratch
COPY --from=dwnld /srv/alpine/. /.
RUN mkdir /txData && chown 1000:1000 /txData
RUN addgroup -S --gid 1000 cfx && adduser -S --uid 1000 cfx -G cfx
USER cfx
WORKDIR /opt/cfx-server
EXPOSE 30120/tcp 30120/udp 40120/tcp
ENTRYPOINT ["/opt/cfx-server/FXServer"]
