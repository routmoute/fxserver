FROM alpine AS dwnld
RUN apk update --no-cache && apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/20664-1fad6e0835388f7039a84376bc75c313abe18a04/fx.tar.xz | tar xJ -C /srv/.

FROM scratch
COPY --from=dwnld /srv/alpine/. /.
RUN apk update --no-cache && apk --no-cache add ca-certificates openssl
RUN addgroup -g 1000 -S cfx && adduser -u 1000 -S cfx -G cfx
RUN mkdir /txData && chown cfx:cfx /txData
USER cfx
WORKDIR /opt/cfx-server
EXPOSE 30120/tcp 30120/udp 40120/tcp
ENTRYPOINT ["/opt/cfx-server/ld-musl-x86_64.so.1", "FXServer"]
