FROM alpine AS dwnld
RUN apk update --no-cache && apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/25718-595ff67ecfc479c3387b60caa6e3844096971242/fx.tar.xz | tar xJ -C /srv/.

FROM scratch
COPY --from=dwnld /srv/alpine/. /.
RUN apk --no-cache add ca-certificates openssl
RUN addgroup -g 1000 -S cfx && adduser -u 1000 -S cfx -G cfx
RUN mkdir /txData && chown cfx:cfx /txData
USER cfx
WORKDIR /opt/cfx-server
EXPOSE 30120/tcp 30120/udp 40120/tcp
ENTRYPOINT ["/opt/cfx-server/ld-musl-x86_64.so.1", "--library-path", "/usr/lib/v8/:/usr/lib/", "--", "FXServer", "+set", "citizen_dir", "/opt/cfx-server/citizen/"]
