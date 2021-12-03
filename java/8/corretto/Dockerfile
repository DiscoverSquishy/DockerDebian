FROM amazoncorretto:8-alpine-jdk

LABEL author="DiscoverSquishy" maintainer="noaimi2214@gmail.com"

RUN apk add ca-certificates curl wget openssl git tar sqlite fontconfig iproute2 tar --no-cache \
    && adduser -D -h /home/container container \
    && apk --no-cache upgrade musl

# package update & upgrade
RUN apk update --no-cache \
    apk upgrade --no-cache

# Package cleanup
RUN rm -rf /var/cache/apk/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]