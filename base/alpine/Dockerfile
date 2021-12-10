FROM alpine:3.15

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apk add ca-certificates curl wget openssl git tar sqlite fontconfig iproute2 tar --no-cache

# package update & upgrade
RUN apk u--no-cache update  \
    apk --no-cache upgrade

# Package cleanup
RUN rm -rf /var/cache/apk/*