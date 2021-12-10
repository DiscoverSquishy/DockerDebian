FROM alpine:3.15

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apk add --no-cache ca-certificates curl wget openssl git tar sqlite fontconfig iproute2 tar

RUN adduser -D -h /home/container container

# package update & upgrade
RUN apk --no-cache update  \
    apk --no-cache upgrade

# Package cleanup
RUN rm -rf /var/cache/apk/*