FROM alpine AS dwnld
RUN apk update --no-cache && apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/6301-9205ef5f34b53574f15034d2f16262df2f1207c9/fx.tar.xz | tar xJ -C /srv/.

FROM scratch
COPY --from=dwnld /srv/alpine/. /.
RUN addgroup -S cfx && adduser -S cfx -G cfx
RUN mkdir /txData && chown cfx:cfx /txData
USER cfx
WORKDIR /opt/cfx-server
EXPOSE 30120/tcp 30120/udp 40120/tcp
ENTRYPOINT ["/opt/cfx-server/FXServer"]
