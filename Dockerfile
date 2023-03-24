FROM alpine AS dwnld
RUN apk update --no-cache && apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/6362-4d0535f47951790580279415aec0c68e133ba705/fx.tar.xz | tar xJ -C /srv/.

FROM scratch
COPY --from=dwnld /srv/alpine/. /.
COPY --from=alpine / /
RUN apk update --no-cache && apk upgrade --no-cache
RUN addgroup -g 1000 -S cfx && adduser -u 1000 -S cfx -G cfx
RUN mkdir /txData && chown cfx:cfx /txData
USER cfx
WORKDIR /opt/cfx-server
EXPOSE 30120/tcp 30120/udp 40120/tcp
ENTRYPOINT ["/opt/cfx-server/FXServer"]
