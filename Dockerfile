FROM alpine AS dwnld
RUN apk update --no-cache && apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3889-517c63ee1e25f9bce9b09a4563d030fdf504f3b9/fx.tar.xz | tar xJ -C /srv/.

FROM scratch
COPY --from=dwnld /srv/alpine/. /.
WORKDIR /opt/cfx-server
EXPOSE 30120/tcp 30120/udp 40120/tcp
ENTRYPOINT ["sh", "run.sh"]
