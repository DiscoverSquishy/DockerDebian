FROM alpine:3.15

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apk add ca-certificates curl wget openssl git tar sqlite fontconfig iproute2 tar --no-cache \
    && apk --no-cache upgrade musl

# package update & upgrade
RUN apk update --no-cache \
    apk upgrade --no-cache

# Package cleanup
RUN rm -rf /var/cache/apk/*