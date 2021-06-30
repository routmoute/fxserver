FROM alpine AS dwnld
RUN apk update --no-cache && apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/4162-b20486b86a968b9e0d36b10cc7c88d83de579e79/fx.tar.xz | tar xJ -C /srv/.

FROM scratch
COPY --from=dwnld /srv/alpine/. /.
WORKDIR /opt/cfx-server
EXPOSE 30120/tcp 30120/udp 40120/tcp
ENTRYPOINT ["/opt/cfx-server/FXServer"]
